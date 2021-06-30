
use strict;

=begin
    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
    4 9 7 8 3 1 1 7 3 8 0   5  7  6  0  4 

    On commence par doubler tout les nombres de rang impaires.

    clé de luhn non calculé => 4

    4*2 7*2 3*2 1*2 3*2 0*2 7*2 0*2

    si le double du chiffre obtenu est superieur ou égal à 10 on fait la somme des deux chiffres

    8 (14 > 10 => 1+4 => 5) 6 2 6 0 (14 > 10 => 1+4 => 5) 0
    8+9+5+8+6+1+2+7+6+8+0+5+5+6+0 => 71
    si 81 % 10 == 0 la carte est valide sinon invalide

=cut


package ValidBin;

    sub parse_str_list_to_int {
        my @number = split("", $_[1]);
        for (my $i = 0; $i < length($_[1]); $i++) {
            $number[$i] = int($number[$i]); 
        }
        return @number;
    }

    sub luhn_algorithm {
        my @card_number_list = $_[0]->parse_str_list_to_int($_[1]);
        my $s = 0;

        for (my $i = 1; $i <= 8; $i++) {
            $card_number_list[2*$i-2] = ($card_number_list[2*$i-2]*2 >= 10 ? ((int(($card_number_list[2*$i-2]*2)/10))+(($card_number_list[2*$i-2]*2)%10)) : $card_number_list[2*$i-2]*2);
        }

        for(my $i = 0; $i <= 14; $i++) {
            $s += $card_number_list[$i];
        }
        
        if(10-($s%10) == $card_number_list[-1]) {
            return 1;
        } else {
            return 0;
        }
       
    }
    

1;


print ValidBin->luhn_algorithm("4024007146302608");

