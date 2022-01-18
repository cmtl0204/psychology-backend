<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;

class DeleteTempCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'delete:temp';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Delete temp directory';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        try {
            Storage::delete(Storage::files('temp'));
            logger(date('Y-m-d H:i:s') . ' Se eliminaron todos los archivos de la carpeta temp');
            return 1;
        } catch (\Exception $e) {
            logger(date('Y-m-d H:i:s') . $e);
            return 0;
        }
    }
}
