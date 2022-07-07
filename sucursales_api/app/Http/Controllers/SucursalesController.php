<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Controllers\Controller;

use App\Http\Requests;

class SucursalesController extends Controller
{
           
    public function show()
    {
        $sucursales =DB::select('call show_sucursales');
        return $sucursales;
    }

    public function create(Request $request)
    {
        $nombre= $request->nombre;
      DB::select('call create_sucursal(?)',array($nombre));
      //  return $nombre;
     

      return ["nombre"=>$nombre];
    }

    public function update($nombre, $id)
    {
        DB::select('call update_sucursal(?,?)',array($id,$nombre));
        return $nombre;
    }

    public function destroy($id)
    {
        DB::select('call delete_sucursal(?)',array($id));
        return $id;
    }
}
