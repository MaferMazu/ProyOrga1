public class TAD_Directorio
{
	private int tamano; //Cantidad de archivos dentro del Dir.
	private dir primero; //Contiene la direccion del primer archivo
	private dir ultimo; //Contiene la dir del ultimo
	private dir Directorio; //Almaceno la dir del directorio

	public int TAD_Directorio(){
		//Esto es el dir_init
		tamano = 0; //Ocupa 4 bytes por ser int
		primero = null; //Ocupa 4 b
		ultimo =null; //Ocupa 4b
		Directorio: funcion pidoMemoria
		if(Directorio.contenido<0){
			return -1;
		}
		else{
			return 0;
		}
	}

	public int dir_cp(String n1,String n2){

	}

	public int dir_make(String n1, String contenido){

	}

	public int dir_rem(){
		
	}
}