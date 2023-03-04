# PHP Frameworks Bench
![GitHub release (latest by date)](https://img.shields.io/github/v/release/myaaghubi/PHP-Frameworks-Bench?color=purpol) ![GitHub](https://img.shields.io/github/license/myaaghubi/PHP-Frameworks-Bench?color=green)

This project attempts to measure the minimum overhead (minimum bootstrap cost) of PHP frameworks in the real world.

So I think the minimum should not include:

* cost of template engine
* cost of database manipulation
* cost of debugging information

Benchmarking on components like template engines or ORM/Database libraries is out of the scope of this project.


- [PHP Frameworks Bench](#php-frameworks-bench)
  - [Benchmarks](#benchmarks)
    - [Latest](#latest)
  - [Benchmarking Policy](#benchmarking-policy)
  - [How to Benchmark](#how-to-benchmark)
  - [Commands](#commands)
  - [References](#references)
  - [License](#license)


## Benchmarks

### Latest

#### Environment

* Ubuntu 22.04 LTS 64bit
  * PHP 8.1.6
  * OPCache enabled
  * Apache 2.4.52
  * CPU Core i7 2600K@4Ghz
  * Memory 16G 


#### Results (2022/5/22)

These are my benchmarks, not yours. **I encourage you to run on your (production equivalent) environments.**

![Benchmark Results Graph Throughput](screenshots/php-frameworks-bench-throughput.png)
![Benchmark Results Graph Memory](screenshots/php-frameworks-bench-memory.png)
![Benchmark Results Graph Execution Time](screenshots/php-frameworks-bench-exectime.png)
![Benchmark Results Graph Included Files](screenshots/php-frameworks-bench-includedfiles.png)

|framework          |requests per second|relative|peak memory|relative|
|-------------------|------------------:|-------:|----------:|-------:|
|pure-php           |          42,114.24|    52.1|       0.34|     1.0|
|phroute-2.2        |          33,424.47|    42.4|       0.34|     1.0|
|fastroute-1.3      |          33,190.14|    42.1|       0.34|     1.0|
|siler-1.7.9        |          22,152.74|    28.8|       0.36|     1.1|
|leaf-3.0           |          20,685.10|    26.3|       0.36|     1.1|
|fatfree-3.8.0      |          19,282.52|    24.5|       0.39|     1.1|
|frameworkx-dev     |          18,033.22|    22.9|       0.37|     1.1|
|slim-4.10          |          14,958.27|    19.0|       0.38|     1.1|
|slim-3.12          |          14,714.84|    18.7|       0.39|     1.1|
|yii-2.0-basic      |          11,831.91|    15.0|       0.70|     2.1|
|ubiquity-2.4.x.dev |          11,669.47|    14.8|       0.38|     1.1|
|silex-2.3          |          10,415.74|    13.2|       0.39|     1.1|
|symfony-5.4        |           9,761.44|    12.4|       0.46|     1.4|
|symfony-6.0        |           9,737.48|    12.4|       0.45|     1.3|
|lumen-9.0          |           6,205.79|     7.7|       0.39|     1.1|
|cakephp-4.3        |           5,562.91|     7.0|       0.43|     1.3|
|laminas-2.0.x.dev  |           5,015.71|     6.4|       0.49|     1.4|
|fuelphp-1.9        |           4,894.22|     6.2|       0.45|     1.3|
|codeigniter-4.1    |           1,938.43|     2.5|       1.46|     4.3|
|laravel-9.1        |             788.76|     1.0|       0.55|     1.6|


## Benchmarking Policy

This is `master` branch.

* Install a framework via `composer` according to the official documentation.
* Use the default configuration.
  * Consider minimum changes to run the benchmark.
  * Don't remove any components/configurations even if there be no use for them.
* Have a `controller` class for the `Hello World`, considering the default template of a controller of your framework.
* Turn off `debug` mode and set environment to `production` mode.
* Run the general optimization in your production environment, like `--optimize-autoloader` for the composer.

Some frameworks are optimized more than others, so some people may think using default configuration is not fair. The dept of optimizing a framework depends on the developer's experience too, so it's the rabbit hole and there is no point in it. I think the default configuration of frameworks is a good starting point to get ranking.

If you find something wrong in my code, feel free to send a PR. But please note optimizing for the "Hello World" is not acceptable! Building the fastest `Hello World` application is not the goal of this project.


## How to Benchmark

If you want to have benchmarks on `PHP extension frameworks` like Phalcon, you need to install the extension first based on its own documentation.

1- Download & install the library into your localhost:

```bash
# you can put --branch vx.x
$ git clone https://github.com/myaaghubi/php-frameworks-bench.git

$ cd php-frameworks-bench

# run the setup & follow the progress
$ bash setup.sh
```

2- To make sure everything is ok:

```bash
# this is optional
$ bash check.sh
```

3- Run benchmarks:

```bash
$ bash benchmark.sh
```

4- Check the resuts:

<http://localhost/php-frameworks-bench/>


## Commands

```bash
# composer update for each framework
$ bash update.sh

# to clean them all
# trouble? run it then
# you can use setup.sh 
$ bash clean.sh

# clear the cache of frameworks
$ bash clear-cache.sh

# show the table of last benchmark
$ bash show-table.sh
```

To specify the frameworks, put them after each command:

```bash
# supported for `setup.sh`, `benchmark.sh`, `update.sh`, `clean.sh`, and `clear-cache.sh`
$ bash benchmark.sh laravel-9.1/ slim-4.10/ fatfree-3.8.0/
...
```


## References 
Note: This project is based on
[php-framework-benchmark](https://github.com/kenjis/php-framework-benchmark), thanks to [Kenjis](https://github.com/kenjis). It is very old and abandoned, so I decided to split it from the origin and update it separately.

For frameworks, I considered the official repos:
* [CakePHP](https://github.com/cakephp/cakephp)
* [CodeIgniter](https://github.com/codeigniter4/CodeIgniter4)
* [FastRoute](https://github.com/nikic/FastRoute)
* [FatFree](https://github.com/bcosca/fatfree)
* [FrameworkX](https://github.com/clue/framework-x)
* [FuelPHP](https://github.com/fuelphp/fuelphp)
* [Laminas](https://github.com/laminas)
* [Laravel](https://github.com/laravel/laravel)
* [Leaf](https://github.com/leafsphp/leaf)
* [Lumen](https://github.com/laravel/lumen)
* [PhRoute](https://github.com/mrjgreen/phroute)
* [Siler](https://github.com/leocavalcante/siler)
* [Silex](https://github.com/silexphp/Silex)
* [Slim](https://github.com/slimphp/Slim)
* [Symfony](https://github.com/symfony/symfony)
* [Ubiquity](https://github.com/phpMv/ubiquity)
* [Yii](https://github.com/yiisoft/yii2)


## License

You are allowed to use this plugin/project under the terms of the GNU General Public License version 2.

Copyright (C) 2023 Mohammad Yaaghubi
