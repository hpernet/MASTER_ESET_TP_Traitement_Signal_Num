function [ Symbol, NbPt_Symbol , Fech] =FCT_CODE_WH(BinaryChipSequence,ChipTime,Fe,Amplitude)

  Fech=Fe;

  % Nombre de point par chip ou bit
    NbPt_Chip=(ChipTime*Fe);
    
  % Longueur de la BinaryChipSequence
   BinarySequenceLength = length(BinaryChipSequence);
  
  % Nombre de point par symbole
   NbPt_Symbol   = NbPt_Chip *  BinarySequenceLength ;

    
  % Creation du vecteur symbole et mise à zero de tout le vecteur
    Symbol=zeros(NbPt_Symbol ,1);
    
    
   for   n =1 :  BinarySequenceLength      % NbPt_Chip : NbPt_Symbol 
         
      if ( BinaryChipSequence(n) > 0  )
           Symbol([ ((n-1) * NbPt_Chip +1)  :  (n * NbPt_Chip)] )   =  Amplitude;
      else
           Symbol([ ((n-1) * NbPt_Chip +1)  :  (n * NbPt_Chip)] )   = -  Amplitude;
      end
      
  end     
    
