<?php

namespace App\Http\Controllers;

use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UsuarioController extends Controller
{
    public function index()
    {
        return Usuario::all();
    }
    public function store(Request $request)
    {
        $usuario = Usuario::create($request->all());
        if ($usuario) {
            return response()->json(['message' => 'Los datos del usuario se han guardado correctamente', 'success' => true], 201);
        } else {
            return response()->json(['message' => 'No se puede guardar los datos del usuario por favor inténtalo más tarde', 'success' => false], 404);
        }
    }
    public function login (Request $request){
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);
        $usuario=Usuario::where('email',$request->email)->first();
        if(!$usuario||!Hash::check($request->password,$usuario->password)){
           return response()->json(['message'=>'Credenciales incorrectas','success'=>false],401);
        }else{
            return response()->json(['message'=>'Credenciales correctas','success'=>true],201);
        }

    }
    public function update(Request $request,$id){
        $usuario=Usuario::findOrFail($id);
        $usuario->update($request->all());
        if ($usuario) {
            return response()->json(['message' => 'Los datos del usuario se han actualizado correctamente', 'success' => true], 201);
        } else {
            return response()->json(['message' => 'No se puede actualizar los datos del usuario por favor inténtalo más tarde', 'success' => false], 404);
        }
    }
    public function destroy($id){
        Usuario::destroy($id);
        return response()->json(null, 204);
    }
}
