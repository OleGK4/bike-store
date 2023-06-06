<?php

namespace Database\Seeders;

use App\Models\Bike;
use App\Models\Brand;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Brand::factory()
            ->count(50)
            ->has(Bike::factory()->count(3))
            ->create();
    }
}
