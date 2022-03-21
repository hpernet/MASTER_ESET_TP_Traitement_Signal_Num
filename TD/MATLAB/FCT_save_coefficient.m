function FCT_save_coefficient(NomFichier,Coeff,NumOrDeno)
  
     nbCoeff = length(Coeff);
     fid = fopen(NomFichier,'w');
     if(NumOrDeno == 'N')
              fprintf(fid,'#define Nb_Coeff_Nume %d \n',  nbCoeff);
              fprintf(fid,'double Coeff_Filtre_Nume[Nb_Coeff_Nume]={');           
     else
              fprintf(fid,'#define Nb_Coeff_Deno %d \n\n',  nbCoeff-1);
              fprintf(fid,'double Coeff_Filtre_Deno[Nb_Coeff_Deno]={');         
     end;
     
     if (NumOrDeno == 'N')        
           for n=1:(nbCoeff-1)
                fprintf(fid,'%5.16f, ',Coeff(n));
           end  
          fprintf(fid,'%5.16f};\n ',Coeff(n+1));     
     else
           for n=2:(nbCoeff-1)
                fprintf(fid,'%5.16f, ',Coeff(n));
           end  
          fprintf(fid,'%5.16f};\n ',Coeff(n+1));               
     end    
    fclose(fid);
    
 end 
   
                            
                            
                            
 
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  