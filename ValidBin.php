<?php

class ValidBin {

    private function parse_str_to_int_array($str_card_number) {
        $card_array = explode("", $str_card_number);
        for($i = 0; $i < count($card_array); $i++) {
            $card_array[$i] = intval($card_array[$i]);
        }

        return $card_array;
    }

    public function luhn_algorithm($card_number) {
        $card_number_integer = $this->parse_str_to_int_array($card_number);
        $s = 0;

        for ($i = 1; $i <= 8; $i++) {
            $card_number_integer[2*$i-2] = $card_number_integer[2*$i-2]*2 >= 10 ? (($card_number_integer[2*$i-2]*2)/10)+(($card_number_integer[2*$i-2]*2)%10) : $card_number_integer[2*$i-2]*2;
        }

        for ($i = 0; $i <= 14; $i++) {
            $s += $card_number_integer[$i];
        }

        if(10-($s%10) == $card_number_integer[-1]) {
            return true;
        } else {
            return false;
        }
    }
}

$cc = "4978811790135645";

$valid_bin = new ValidBin();
echo $valid_bin->luhn_algorithm($cc);