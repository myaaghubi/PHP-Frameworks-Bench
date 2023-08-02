<?php
echo 'PHP: '.phpversion().PHP_EOL;
echo 'OPCache: '.(is_array(opcache_get_status()) ? 'On' : 'Off').PHP_EOL;