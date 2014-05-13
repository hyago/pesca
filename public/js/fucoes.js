/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public function teste(){
    $decisao = confirm("Deseja continuar");
    if(($decisao)){
        location.href=' http://localhost/projeto/public/nomeController/NomeAction ';
    }
}
