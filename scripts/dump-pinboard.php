<?php
$stderr  = fopen('php://stderr', 'w');
$lastrun = __DIR__ . '/../lastrun.txt';

if ($argc > 2) {
    $url = realpath($argv[1]);
    if (!is_readable($url) || !is_file($url)) {
        exit('file '.$url.' not readable');
    }
    fwrite($stderr, 'Using '.$url. PHP_EOL);
} else {
    $url = 'http://feeds.pinboard.in/json/v1/u:winks/';
    fwrite($stderr, 'Using '.$url. PHP_EOL);
}
$source = file_get_contents($url);
$json   = json_decode($source, true);
$items  = array();

if (is_readable($lastrun)) {
    $last = file_get_contents($lastrun);
    $last = split(';', $last);
    $last = array_map('trim', $last);
    $lastDate = $last[0];
    $lastTs   = $last[1];
    fwrite($stderr, 'From '. $lastDate .PHP_EOL);
} else {
    die("no lastrun.txt found!");
}

$nowTs = time();
$line = sprintf("%s;%s", date('c', $nowTs), $nowTs);
file_put_contents($lastrun, $line);

$fix_tags = function ($tag) {
    $special = array(
        'anigif' => 'Animated GIF',
        'c-lang' => 'C',
        'clojurescript' => 'ClojureScript',
        'devops' => 'DevOps',
        'couchdb' => 'CouchDB',
        'email' => 'E-Mail',
        'gamedev' => 'Game Development',
        'gifs' => 'GIFs',
        'ipv6' => 'IPv6',
        'javascript' => 'JavaScript',
        'mysql' => 'MySQL',
        'ocaml' => 'OCaml',
        'opengl' => 'OpenGL',
        'opensource' => 'Open Source',
        'openstack' => 'OpenStack',
        'openvpn' => 'OpenVPN',
        'osdev' => 'OSDev',
        'paas' => 'PaaS',
        'postgresql' => 'Postgres',
        'rethinkdb' => 'RethinkDB',
        'scifi' => 'Science Fiction',
        'starwars' => 'Star Wars',
        'webdev' => 'Web Development',
        'zeromq' => 'ZeroMQ',
    );
    if (array_key_exists(strtolower($tag), $special)) {
        return $special[strtolower($tag)];
    }
    $upper = array(
        '3d',
        'ai',
        'ascii',
        'amqp',
        'awk',
        'aws',
        'bsd',
        'c',
        'c++',
        'cap',
        'cms',
        'css',
        'fosdem',
        'gl',
        'gpg',
        'html',
        'http',
        'ide',
        'irc',
        'lxc',
        'mq',
        'mqtt',
        'php',
        'rest',
        'rpg',
        'rss',
        'sat',
        'scm',
        'ssh',
        'ssl',
        'stm',
        'uefi',
        'unix',
        'vim',
        'vpn',
        'wtf',
        'xmpp',
        'zfs',
    );
    if (in_array(strtolower($tag), $upper)) {
        return strtoupper($tag);
    }
    $lower = array(
        'make',
        'rsync',
        'tmux',
        'virtualenv',
    );
    if (in_array(strtolower($tag), $lower)) {
        #return strtolower($tag);
    }
    return ucfirst(strtolower($tag));
};
function fix_title($s) {
    $meh = array(
        ' - YouTube',
        ' · GitHub',
    );
    foreach ($meh as $m) {
        if (substr($s, (0 - strlen($m))) == $m) {
            return preg_replace(
                sprintf("(%s$)", $m),
                '',
                $s
            );
        }
    }
    return $s;
}

foreach ($json as $item) {
    if (strtotime($item['dt']) < $lastTs) {
        fwrite($stderr, sprintf("Skipping %s".PHP_EOL, $item['d']));
        continue;
    }
    $slug = ucfirst(strtolower(preg_replace('([^A-Za-z0-9]+)','', $item['d'])));
    if (substr($item['d'], 0, 10) == 'Twitter / ') {
        array_unshift($item['t'], '_from_twitter');
    }
    $item['d'] = fix_title($item['d']);
    $item['t'] = array_map('ucfirst', $item['t']);
    $item['t'] = array_map($fix_tags, $item['t']);
    $k = implode('/', $item['t']);
    $v = sprintf("[%s][%s]\n\n[%s]: %s\n\n", $item['d'], $slug, $slug, $item['u']);
    if (!array_key_exists($k, $items) || !is_array($items[$k])) {
        $items[$k] = array();
    }
    $items[$k][] = $v;
}

uksort($items, function($a, $b){
    return strcasecmp($a, $b);
});

foreach ($items as $k => $v) {
    printf("### %s\n\n", ucfirst($k));
    array_map(function ($x) {
        printf(" - %s\n\n", $x);
    }, $v);

}

fwrite($stderr, sprintf('Items: %d/%d' . PHP_EOL, count($items), count($json)));
