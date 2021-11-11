<?php declare(strict_types=1);

namespace Siler\Prelude;

use function Siler\Obj\patch;

/**
 * @template T
 */
trait Patch
{
    /**
     * @param array $data
     * @return mixed
     * @psalm-return T
     */
    public function patch(array $data)
    {
        return patch($this, $data);
    }
}
