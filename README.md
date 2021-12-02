# PHP Frameworks Bench v1.2

This project attempts to measure minimum overhead (minimum bootstrap cost) of PHP frameworks in the real world.

So I think the minimum applications to benchmark should not include:

* cost of template engine (HTML output)
* cost of database manipulation
* cost of debugging information

Components like Template engine or ORM/Database libraries are out of scope in this project.

## Benchmarking Policy

This is `master` branch.

* Install a framework according to the official documentation.
* Use the default configuration.
  * Don't remove any components/configurations even if they are not used.
  * With minimum changes to run this benchmark.
* Set environment production/Turn off debug mode.
* Run optimization which you normally do in your production environment, like Composer's `--optimize-autoloader`.
* Use controller or action class if a framework has the functionality.

Some people may think using default configuration is not fair. But I think a framework's default configuration is an assertion of what it is. Default configuration is a good starting point to know a framework. And I can't optimize all the frameworks. Some frameworks are optimized, some are not, it is not fair. So I don't remove any components/configurations.

If you find something wrong with my code, please feel free to send Pull Requests. But please note optimizing only for "Hello World" is not acceptable! Building fastest "Hello World" application is not the goal in this project.

## Results

### Benchmarking Environment

* Windows 10 64bit (bash executed on WSL 2)
  * PHP 8.0 (XAMPP x64)
  * CPU Core i7 2600K@4Ghz
  * Memory 16G 

### Hello World Benchmark

These are my benchmarks, not yours. **I encourage you to run on your (production equivalent) environments.**

(2021/11/11)

![Benchmark Results Graph Throughput](screenshots/php-frameworks-bench-throughput.jpg)
![Benchmark Results Graph Memory](screenshots/php-frameworks-bench-memory.jpg)
![Benchmark Results Graph Execution Time](screenshots/php-frameworks-bench-exectime.jpg)
![Benchmark Results Graph Included Files](screenshots/php-frameworks-bench-includedfiles.jpg)

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

## How to Benchmark

If you want to benchmark PHP extension frameworks like Phalcon, you need to install the extenstions.

Install source code as <http://localhost/php-frameworks-bench/>:

~~~
$ git clone https://github.com/myaghobi/php-frameworks-bench.git
$ cd php-frameworks-bench
$ bash setup.sh
~~~

Run benchmarks:

~~~
$ bash benchmark.sh
~~~

See <http://localhost/php-frameworks-bench/>.

If you want to benchmark some frameworks:

~~~
$ bash setup.sh fatfree-3.7.3/ slim-4.9/
$ bash benchmark.sh fatfree-3.7.3/ slim-4.9/
~~~

## Linux Kernel Configuration

I added below in `/etc/sysctl.conf`

~~~
# Added
net.netfilter.nf_conntrack_max = 100000
net.nf_conntrack_max = 100000
net.ipv4.tcp_max_tw_buckets = 180000
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 10
~~~

and run `sudo sysctl -p`.

If you want to see current configuration, run `sudo sysctl -a`.

## Apache Virtual Host Configuration

~~~
<VirtualHost *:80>
  DocumentRoot /home/vagrant/public
</VirtualHost>
~~~


## References 
Note: This project is based on
[php-framework-benchmark](https://github.com/kenjis/php-framework-benchmark). It was very old and no longer maintained, so I decided to split it from the origin repo and update it separately.

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
