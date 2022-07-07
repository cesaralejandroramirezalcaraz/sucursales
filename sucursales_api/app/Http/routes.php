<?php

   
Route::get('/sucursal/','SucursalesController@show'); 
Route::post('/sucursalC/','SucursalesController@create');
Route::get('/sucursalU/{nombre}/{id}','SucursalesController@update');
Route::get('/sucursalD/{id}','SucursalesController@destroy');

Route::get('/ordenes/','OrdenesController@show'); 
Route::post('/ordenesC/','OrdenesController@create');
Route::get('/ordenesU/{ordenId}/{sucursalId}/{fecha}/{total}','OrdenesController@update');
Route::get('/ordenesD/{id}','OrdenesController@destroy');

Route::get('/productos/','ProductosController@show'); 
Route::post('/productosC','ProductosController@create');
Route::post('/productosU/','ProductosController@update');
Route::get('/productosD/{id}','ProductosController@destroy');