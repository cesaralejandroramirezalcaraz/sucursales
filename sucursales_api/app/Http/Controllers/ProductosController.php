<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use DB;
class ProductosController extends Controller
{
    public function show()
    {
        $ordenes =DB::select('CALL show_productos');
        return $ordenes;
    }

    public function create(Request $request)
    { 
        $ordenId = $request->ordenId;
        $codigo= $request->codigo;
        $descripcion= $request->descripcion;
        $precio=$request-> precio;
       DB::select('call create_producto(?,?,?,?)',array($ordenId,$codigo,$descripcion,$precio));
        return ["orden_id"=>$ordenId,"codigo"=>$codigo,"descripcion"=>$descripcion,"precio"=> $precio];
      
    }

    public function update(Request $request)
    {
        $productoId =$request->productoId;
        $ordenId = $request->ordenId;
        $codigo= $request->codigo;
        $descripcion= $request->descripcion;
        $precio=$request->precio;
        DB::select('call update_producto(?,?,?,?,?)',array($productoId,$ordenId,$codigo,$descripcion,$precio));
        return ["orden_id"=>$ordenId,"codigo"=>$codigo,"descripcion"=>$descripcion,"precio"=> $precio];
    }
    
    public function destroy($id)
    {
        DB::select('call delete_producto(?)',array($id));
        return $id;
    }
}
