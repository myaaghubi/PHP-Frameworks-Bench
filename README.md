# PHP Frameworks Bench
[![Test PHP benchmark](https://github.com/myaaghubi/PHP-Frameworks-Bench/actions/workflows/test.yml/badge.svg)](https://github.com/myaaghubi/PHP-Frameworks-Bench/actions/workflows/test.yml) ![GitHub release (latest by date)](https://img.shields.io/github/v/release/myaaghubi/PHP-Frameworks-Bench?color=purpol) ![GitHub](https://img.shields.io/github/license/myaaghubi/PHP-Frameworks-Bench?color=green)


📊 This project attempts to measure the minimum overhead (minimum bootstrap cost) of PHP frameworks in the real world.

So I think the minimum should not include:

* cost of template engine
* cost of database manipulation
* cost of debugging information

Benchmarking on components like template engines or ORM/Database libraries is out of the scope of this project.


- [PHP Frameworks Bench](#php-frameworks-bench)
  - [Benchmarks](#benchmarks)
    - [Latest](#latest)
    - [OPCache On/Off](#opcache-on)
  - [How to Benchmark](#how-to-benchmark)
  - [Docker](#docker)
  - [Commands](#commands)
  - [Benchmarking Policy](#benchmarking-policy)
  - [Add Your Framework](#add-your-framework)
  - [Donate](#-donate)
  - [References](#references)
  - [License](#license)


## Benchmarks

### Latest

#### Environment

For `PHP 8.3` check out [this link](https://github.com/myaaghubi/PHP-Frameworks-Bench/tree/92cce05b3f6cf0aa33a06c3f13d8dd0c706f3b6c).

For `PHP 8.2` check out [this link](https://github.com/myaaghubi/PHP-Frameworks-Bench/tree/163d2c0eb7862cf3c14479913435cb90ec7d6f0b).

* Ubuntu 24.04 LTS x86_64
  * PHP 8.4.3
  * OPCache Off ([Why Not??](https://github.com/myaaghubi/PHP-Frameworks-Bench/wiki/Why-not-OPcache-ON%3F%3F))
  * Apache 2.4.58
  * WRK 4.2.0 (5 min)
  * CPU Core i7-3770K/4.4Ghz
  * Memory 16G 


#### Results (2025/2/7)

These are my benchmarks, not yours. **I encourage you to run on your -production equivalent- environments.**
```bash
# the command used for the results below
$ bash benchmark.sh -f -rapache
```

![Frameworks Benchmark Results Graph Throughput](screenshots/php-frameworks-bench-throughput.png)
![Frameworks Benchmark Results Graph Memory](screenshots/php-frameworks-bench-memory.png)
![Frameworks Benchmark Results Graph Execution Time](screenshots/php-frameworks-bench-exectime.png)
![Frameworks Benchmark Results Graph Included Files](screenshots/php-frameworks-bench-includedfiles.png)

|framework          |requests per second (rps)|relative (rps)|peak memory|relative (mem)|
|-------------------|------------------------:|-------------:|----------:|-------------:|
|pure-php           |                25,833.28|         409.4|       0.42|           1.0|
|kumbia-1.2         |                 5,681.12|          90.0|       0.54|           1.3|
|fastroute-1.3      |                 4,262.94|          67.6|       0.56|           1.3|
|phroute-2.2        |                 3,949.48|          62.6|       0.58|           1.4|
|fatfree-3.9        |                 1,364.24|          21.6|       1.72|           4.1|
|leaf-3.11          |                 1,298.60|          20.6|       1.18|           2.8|
|slim-4.14          |                   741.19|          11.7|       1.59|           3.8|
|yii-2.0-basic      |                   527.72|           8.4|       2.60|           6.2|
|silex-2.3          |                   512.44|           8.1|       2.28|           5.4|
|lumen-10.0         |                   301.01|           4.8|       3.78|           9.0|
|symfony-5.4        |                   281.95|           4.5|       3.84|           9.1|
|codeigniter-4.6    |                   274.93|           4.4|       3.93|           9.4|
|symfony-7.0        |                   261.52|           4.1|       4.20|          10.0|
|symfony-6.4        |                   254.35|           4.0|       4.26|          10.1|
|cakephp-5.1        |                   222.48|           3.5|       4.96|          11.8|
|laravel-10.3       |                    76.35|           1.2|      13.82|          32.9|
|laravel-11.0       |                    63.10|           1.0|      16.19|          38.5|


#### OPCache On
Check out the video for more information.

[![Results with OPCache On/Off & How to add your framework](http://img.youtube.com/vi/Dk8YHQZ6jfY/0.jpg)](http://www.youtube.com/watch?v=Dk8YHQZ6jfY)


## How to Benchmark

If you want to have benchmarks on `PHP extension frameworks` like `Phalcon`, you need to install the extension first, based on its own documentation.

1- Download & Setup:

```bash
# make sure to put it in the root of your web path
$ git clone https://github.com/myaaghubi/PHP-Frameworks-Bench.git

$ cd PHP-Frameworks-Bench

# optional
$ nano config

# run the setup & follow the progress
$ yes | bash setup.sh
```

2- Make sure everything is ok:

```bash
$ bash check.sh
# bash check.sh -t pure-php
# ✔ pure-php
```

3- Run benchmarks:

```bash
# bash benchmark.sh --help
$ bash benchmark.sh
```

4- Check the results:
- web:

  <http://127.0.0.1/PHP-Frameworks-Bench/>

- terminal:
  ```bash
  # bash results.sh --help
  bash results.sh
  ```


## Docker

Results with docker may or may not be reliable but in a situation you can use it like:

1- Change the `base` in `config` on the right port(`8080` considered):

```ini
base="http://127.0.0.1:8080/PHP-Frameworks-Bench"
...
```

2- Run/download the docker:

```bash
$ bash docker-apache.sh
```

3- Run the benchmark:

```bash
# run it in another terminal
$ bash benchmark.sh
```


## Commands

```bash
# use bash benchmark.sh --help
$ bash benchmark.sh -f -rapache -t pure-php

# run composer update for frameworks
$ bash update.sh

# to clean them all
# trouble? run it then
# you can use `bash setup.sh` again
$ bash clean.sh

# clear the cache of frameworks
$ bash clear-cache.sh

# show the results table
$ bash results.sh
```

To specify frameworks, put them with `-t ...` after each command:

```bash
# supported for `setup.sh`, `benchmark.sh`, `update.sh`, `clean.sh`, and `clear-cache.sh`
# bash benchmarks.sh --help
$ bash benchmark.sh -t laravel-10.2/ slim-4.12/ ...
...
```


## Add Your Framework
Check out the [Benchmarking Policy](#benchmarking-policy), to get more information watch the video [OPCache On/Off](#opcache-on).


## Benchmarking Policy

* Use `composer` to install frameworks according to their official documentation.
* Use the default configuration.
  * Minimum changes on frameworks to have benchmarks.
  * Don't remove any components/configurations even if there is no use for them.
* Include a `controller` class to get the `Hello World!` for each, based on the default template of each framework for `controllers`.
* Turn off the `debug` mode and set the environment to `production` mode.
* General optimization for the production environment, like `--optimize-autoloader` for the `composer`.

Some frameworks are optimized more than others, so some developers may think using default configuration is not fair. The dept of optimizing a framework depends on the skills/experiences of the developer too, so it's the rabbit hole and nonsense for ranking. Please **note** optimizing for the `Hello World` is not acceptable! Building the fastest `Hello World` application is not the goal of this project. I think the default configuration of frameworks is a good starting point to have a ranking.

If you find something wrong in my code, feel free to send a `PR`. 


## 🍔 Donate
Don't forget to donate if you find it useful ☕ 🍺 🍸 🍔

ETH: 0x0ADd51D6855d2DF11BB5F331A3fa345c67a863b2

![Ethereum](screenshots/ethereum.jpg?raw=true "Ethereum")


## References 
Note: This project is based on
[php-framework-benchmark](https://github.com/kenjis/php-framework-benchmark), thanks to [Kenjis](https://github.com/kenjis). It is very old and abandoned, so I decided to split it from the origin and change/update it separately.

🙏 Thanks to contributors: 

- [Joan Miquel](https://github.com/joanhey)

- [Rostunov Sergey](https://github.com/stdex)



📄 For frameworks, I considered the official repos:
* [CakePHP](https://github.com/cakephp/cakephp)
* [CodeIgniter](https://github.com/codeigniter4/CodeIgniter4)
* [FastRoute](https://github.com/nikic/FastRoute)
* [FatFree](https://github.com/bcosca/fatfree)
* [FuelPHP](https://github.com/fuelphp/fuelphp)
* [KumbiaPHP](https://github.com/KumbiaPHP/KumbiaPHP)
* [Laminas](https://github.com/laminas)
* [Laravel](https://github.com/laravel/laravel)
* [Leaf](https://github.com/leafsphp/leaf)
* [Lumen](https://github.com/laravel/lumen)
* [PhRoute](https://github.com/mrjgreen/phroute)
* [Silex](https://github.com/silexphp/Silex)
* [Slim](https://github.com/slimphp/Slim)
* [Symfony](https://github.com/symfony/symfony)
* [Ubiquity](https://github.com/phpMv/ubiquity)
* [Yii](https://github.com/yiisoft/yii2)


## License

You are allowed to use this plugin/project under the terms of the GNU General Public License version 2.

Copyright (C) 2025 [Mohammad Yaaghubi](https://github.com/myaaghubi)
