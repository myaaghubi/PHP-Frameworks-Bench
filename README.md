# PHP Frameworks Bench
![GitHub release (latest by date)](https://img.shields.io/github/v/release/myaghobi/PHP-Frameworks-Bench?color=purpol) ![GitHub](https://img.shields.io/github/license/myaghobi/PHP-Frameworks-Bench?color=green)

This project attempts to measure the minimum overhead (minimum bootstrap cost) of PHP frameworks in the real world.

So I think the minimum should not include:

* cost of template engine (HTML output)
* cost of database manipulation
* cost of debugging information

Components like Template engines or ORM/Database libraries are out of scope in this project.


- [PHP Frameworks Bench](#php-frameworks-bench)
  - [Benchmarking Policy](#benchmarking-policy)
  - [How to Benchmark](#how-to-benchmark)
  - [Commands](#commands)
  - [Benchmarks](#benchmarks)
    - [Latest](#latest)
    - [Old](#old)
    - [OPCache](#results-with-opcache)
  - [References](#references)
  - [License](#license)



## Benchmarking Policy

This is `master` branch.

* Install a framework according to the official documentation.
* Use the default configuration.
  * Don't remove any components/configurations even if they are not used.
  * With minimum changes to run this benchmark.
* Set environment production/Turn off debug mode.
* Run the general optimization in your production environment, like `--optimize-autoloader` for the composer.
* Use controller or action class.

Some frameworks are optimized, some are not, so some people may think using default configuration is not fair. The dept of optimizing a framework depends on the developer's knowledge & experienced, it's the rabbit hole and there is no point in that for benchmarking. I think the default configuration of frameworks is a good starting point to have the ranking points.

If you find something wrong with my code, please feel free to send Pull Requests. But please note optimizing for the "Hello World" is not acceptable! Building the fastest "Hello World" application is not the goal of this project.


## How to Benchmark

If you want to benchmark PHP extension frameworks like Phalcon, you need to install the extenstions.

1- Install source code as <http://localhost/php-frameworks-bench/>:

```
# you can use --branch vx.x
$ git clone https://github.com/myaghobi/php-frameworks-bench.git
$ cd php-frameworks-bench
$ bash setup.sh
```

2- Run benchmarks:

```
$ bash benchmark.sh
```

3- Check the resuts:

<http://localhost/php-frameworks-bench/>

## Commands

```
# install | create-project frameworks
$ bash setup.sh

# run the benchmark
$ bash benchmark.sh

# composer update
$ bash update.sh

# to clean them all
# then you can use setup.sh 
# trobble? use it with `sudo`
$ bash clean.sh
```

To specify the frameworks, put them after each command:

```
$ bash benchmark.sh laravel-9.1.3/ slim-4.10/ fatfree-3.7.3/
...
```


## Benchmarks

### Latest

#### Environment

* Ubuntu 20.04 LTS 64bit
  * PHP 8.1.4 (LAMP)
  * CPU Core i7 2600K@3.4Ghz
  * Memory 16G 


#### Results (2022/5/9)

These are my benchmarks, not yours. **I encourage you to run on your (production equivalent) environments.**

![Benchmark Results Graph Throughput](screenshots/php-frameworks-bench-throughput.png)
![Benchmark Results Graph Memory](screenshots/php-frameworks-bench-memory.png)
![Benchmark Results Graph Execution Time](screenshots/php-frameworks-bench-exectime.png)
![Benchmark Results Graph Included Files](screenshots/php-frameworks-bench-includedfiles.png)

PHP 8.1.4 (LAMP)
|framework          |requests per second|relative|peak memory|relative|
|-------------------|------------------:|-------:|----------:|-------:|
|pure-php           |          25,363.33|25,363.3|       0.34|     0.3|
|phroute-2.1        |          20,871.63|20,871.6|       0.34|     0.3|
|fastroute-1.3      |          20,692.36|20,692.4|       0.34|     0.3|
|siler-1.7.9        |          15,140.00|15,140.0|       0.36|     0.4|
|fatfree-3.8.0      |          13,172.39|13,172.4|       0.39|     0.4|
|slim-4.10          |          10,863.08|10,863.1|       0.38|     0.4|
|slim-3.12          |          10,630.10|10,630.1|       0.39|     0.4|
|yii-2.0-basic      |           8,382.51| 8,382.5|       0.69|     0.7|
|silex-2.3          |           8,017.40| 8,017.4|       0.39|     0.4|
|symfony-5.4        |           7,309.46| 7,309.5|       0.46|     0.5|
|symfony-6.0        |           7,272.85| 7,272.9|       0.45|     0.5|
|lumen-9.0.0        |           4,990.60| 4,990.6|       0.39|     0.4|
|cakephp-4.3        |           4,471.16| 4,471.2|       0.43|     0.4|
|fuelphp-1.9        |           3,728.35| 3,728.4|       0.45|     0.5|
|codeigniter-4.1.9  |           1,671.15| 1,671.2|       1.46|     1.5|
|laravel-9.1.3      |             826.64|   826.6|       0.77|     0.8|


### Old

#### Environment

* Windows 10 64bit (bash executed on WSL 2)
  * PHP 8.0 (XAMPP x64)
  * CPU Core i7 2600K@3.4Ghz
  * Memory 16G 


#### Results (2021/12/01)

|framework          |requests per second|relative|peak memory|relative|
|-------------------|------------------:|-------:|----------:|-------:|
|pure-php           |           2,476.19| 2,476.2|       0.42|     0.4|
|fastroute-1.3      |           1,208.93| 1,208.9|       0.57|     0.6|
|phroute-2.1        |           1,201.83| 1,201.8|       0.58|     0.6|
|fatfree-3.7.3      |             695.23|   695.2|       1.67|     1.7|
|siler-1.7.9        |             520.31|   520.3|       1.19|     1.2|
|yii-2.0.14-basic   |             269.47|   269.5|       2.76|     2.8|
|slim-4.9           |             239.09|   239.1|       1.60|     1.6|
|silex-2.3          |             224.29|   224.3|       2.28|     2.3|
|slim-4.3           |             223.43|   223.4|       1.55|     1.6|
|fuelphp-1.8        |             180.84|   180.8|       2.72|     2.7|
|lumen-8.1.2        |             162.19|   162.2|       3.45|     3.5|
|cakephp-4.3        |             108.52|   108.5|       4.49|     4.5|
|symfony-5.3        |              96.57|    96.6|       5.49|     5.5|
|codeigniter-4.1.5  |              75.94|    75.9|       3.37|     3.4|
|laravel-8.6.6      |              39.96|    40.0|      11.90|    11.9|


### Results with OPCache
[![IMAGE ALT TEXT](http://img.youtube.com/vi/BUcxalvD92U/0.jpg)](http://www.youtube.com/watch?v=BUcxalvD92U "PHP OPCache Benchmarks, a Comparison for Popular Frameworks")


## References 
Note: This project is based on
[php-framework-benchmark](https://github.com/kenjis/php-framework-benchmark). It was very old and abandoned, so I decided to split it from the origin and update it separately.

* [CakePHP](https://github.com/cakephp/cakephp)
* [CodeIgniter](https://github.com/codeigniter4/CodeIgniter4)
* [FastRoute](https://github.com/nikic/FastRoute)
* [FatFree](https://github.com/bcosca/fatfree)
* [FuelPHP](https://github.com/fuelphp/fuelphp)
* [Laravel](https://github.com/laravel/laravel)
* [Lumen](https://github.com/laravel/lumen)
* [PhRoute](https://github.com/mrjgreen/phroute)
* [Siler](https://github.com/leocavalcante/siler)
* [Silex](https://github.com/silexphp/Silex)
* [Slim](https://github.com/slimphp/Slim)
* [Symfony](https://github.com/symfony/symfony)
* [Yii](https://github.com/yiisoft/yii2)


## License

You are allowed to use this plugin under the terms of the GNU General Public License version 2.

Copyright (C) 2022 Mohammad Yaghobi
