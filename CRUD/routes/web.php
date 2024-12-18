<?php

use App\Http\Controllers\AddJoias;
use App\Http\Controllers\DeleteJoia;
use App\Http\Controllers\DetalheItem;
use App\Http\Controllers\ListagemJoias;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [ListagemJoias::class, 'listarJoias'])->name('home');
Route::get('/AdicionarJoia', [AddJoias::class, 'addJoias']);
Route::post('/addJoia', [AddJoias::class, 'salvarJoias']);
Route::post('/deleteJoia', [DeleteJoia::class, 'deleteJoia']);
Route::get('/detalheJoia/{id}', [DetalheItem::class, 'detalheItem'])->name('detalheJoia');
Route::put('/detalheJoia/{id}', [DetalheItem::class, 'salvarJoia'])->name('updateJoia');