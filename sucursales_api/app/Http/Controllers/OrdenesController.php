<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use App\Http\Requests;

class OrdenesController extends Controller
{
    public function show()
    {
        $ordenes =DB::select('CALL show_ordenes');
        return $ordenes;
    }

    public function create(Request $request)
    {
        $id=$request->id;
        $fecha=$request->fecha;
        $total=$request->total;
       DB::select('call create_orden(?,?,?)',array($id,$fecha,$total));
        return ["sucursal_id"=>$id,"fecha"=>$fecha,"total"=>$total];
    }

    public function update($ordenId,$sucursalId,$fecha,$total)
    {
        DB::select('call update_orden(?,?,?,?)',array($ordenId,$sucursalId,$fecha,$total));
        return $ordenId;
    }
    
    public function destroy($id)
    {
        DB::select('call delete_orden(?)',array($id));
        return $id;
    }
}
