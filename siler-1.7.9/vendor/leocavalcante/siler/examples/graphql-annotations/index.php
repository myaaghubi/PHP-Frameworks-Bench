<?php declare(strict_types=1);

namespace Siler\Example\GraphQL\Annotation;

use Siler\Route;
use function Siler\GraphQL\{debug, init, subscriptions_at};

require_once __DIR__ . '/../../vendor/autoload.php';
require_once __DIR__ . '/vendor/autoload.php';

$schema = require __DIR__ . '/schema.php';

debug();
subscriptions_at('ws://localhost:3000');

Route\post('/graphql', fn() => init($schema));
