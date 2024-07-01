LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY hw3 IS
    Port(
        --                CLK : in STD_LOGIC;
        --                RST : in STD_LOGIC;
        Hsync, Vsync : out std_logic;
        vgaRed, vgaGreen, vgaBlue : out std_logic_vector(3 downto 0) );





END hw3;

ARCHITECTURE behavior of hw3 IS

    COMPONENT dist_mem_gen_2
        PORT(
            a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            spo: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

        );

    end component;

    COMPONENT dist_mem_gen_3
        PORT(
            a: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            spo: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

        );

    end component;



    COMPONENT dist_mem_gen_4

        PORT(

            clk: IN STD_LOGIC;

            a: IN STD_LOGIC_VECTOR(11 DOWNTO 0);

            we : IN std_logic;

            d : in std_logic_vector ( 19 downto 0) ;

            spo: OUT STD_LOGIC_VECTOR(19 DOWNTO 0) );



    end component;







    -- input

    signal clock1: std_logic := '0';

    signal clock2 : std_logic := '0';

    signal rdaddress : std_logic_vector(11 downto 0) := (others => '0');
    signal filteraddress : std_logic_vector(3 downto 0):= (others => '0');



    signal i : integer := 0;
    signal j : integer := 0;
    signal k : integer := 0;
    signal anup : integer := 1;
    signal new_sig: integer:= -64 ;

    signal a1 : integer := 0;
    signal a2 : integer := 0;
    signal a3 : integer := 0;
    signal a4 : integer := 0;
    signal a5 : integer := 0;
    signal a6 : integer := 0;
    signal a7 : integer := 0;
    signal a8 : integer := 0;
    signal a9 : integer := 0;
    signal calc : integer := 0; --a4 has been renamed to calc





    signal new1 : integer := 0;





    signal data:std_logic_vector(7 downto 0):=(others => '0');
    signal filterdata:std_logic_vector(7 downto 0):=(others => '0');


    signal data1:std_logic_vector(7 downto 0):=(others => '0');

    signal data2:std_logic_vector(7 downto 0):=(others => '0');

    signal data3:std_logic_vector(7 downto 0):=(others => '0');

    signal data4:std_logic_vector(7 downto 0):=(others => '0');

    signal data5:std_logic_vector(7 downto 0):=(others => '0');

    signal data6:std_logic_vector(7 downto 0):=(others => '0');

    signal data7:std_logic_vector(7 downto 0):=(others => '0');

    signal data8:std_logic_vector(7 downto 0):=(others => '0');

    signal data9:std_logic_vector(7 downto 0):=(others => '0');


    constant clock_period : time := 5 ps;

    signal calculated : std_logic_vector (19 downto 0) := (others => '0'); --data4 has been renamed to calculated
    signal data_in : std_logic_vector ( 7 downto 0) := (others => '0');

    signal wr : std_logic := '1';

    signal data_out : std_logic_vector ( 19 downto 0) := (others => '0');

    signal clock : std_logic := '0';

    signal f0: integer := 0;
    signal f1 : integer := 0;
    signal f2 : integer := 0;
    signal f3 : integer := 0;
    signal f4 : integer := 0;
    signal f5 : integer := 0;
    signal f6 : integer := 0;
    signal f7 : integer := 0;
    signal f8 : integer := 0;
    signal f9 : integer := 0;

    signal min : std_logic_vector (19 downto 0) := (others => '0');
    signal max : std_logic_vector (19 downto 0) := (others => '0');
    signal difference : integer := 0;
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';

    signal normValue : integer := 0;

    signal clk50 : std_logic := '0';

    signal clk25 : std_logic := '0';

    constant HD : integer := 639 ;

    constant HFP : integer := 16 ;

    constant HSP : integer :=  96 ;

    constant HBP : integer := 48 ;



    constant VD : integer := 479 ;

    constant VFP : integer := 10 ;

    constant VSP : integer := 2 ;

    constant VBP : integer := 33 ;



    signal hPos : integer := 0 ;

    signal vPos : integer := 0 ;

    signal startNorm : integer := 0;

    signal videoOn : std_logic := '0' ;
    
     signal type1 : std_logic := '0' ;

    signal N : integer := 0;
BEGIN

    uut :dist_mem_gen_2 PORT MAP (

            spo => filterdata,

            a => filteraddress

        );



    uut1 :dist_mem_gen_3 PORT MAP (

            spo => data,

            a => rdaddress

        );



    uut2 : dist_mem_gen_4 PORT MAP (

            clk => clk25,

            d => calculated,

            we => wr,

            spo => data_out,

            a => rdaddress



        );


    clock_process: process
    begin

        clk <= '0';
        wait for clock_period/2;
        clk <= '1';
        wait for clock_period/2;

    end process;


    clk_div50: process(CLK)

    begin

        if(CLK'event and CLK = '1') then

            clk50 <= not clk50;

        end if;

    end process;



    clk_div25: process(CLK50)

    begin

        if(CLK50'event and CLK50 = '1') then

            clk25 <= not clk25;

        end if;

    end process;





    ss1: process(CLk25)

    begin



        if rising_edge(CLK25) then

            if N = 0 then

                if ( j < 10 ) then
                    if(j = 0) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f0 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=1) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f1 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=2) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f4 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=3) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f7 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=4) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f2 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=5) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f5 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=6) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f8 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=7) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f3 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=8) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f6 <= to_integer(signed(filterdata));
                        j <= j+1;
                    elsif(j=9) then
                        filteraddress <= std_logic_vector(to_unsigned(j,4));
                        f9 <= to_integer(signed(filterdata));
                        j <= j+1;
                    end if;

                end if;


                if(j > 9) then
                    if k = 0 then
                        if(new_sig >= 0 and new_sig < 4096) then

                            if type1 = '0' then
                             rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                             a4 <= to_integer(unsigned(data));
                                type1 <= '0';
                                 new_sig <= i ;
                                k <= 1 ;
                             end if ;
                        else
                             a4 <= 0 ;
                             new_sig <= i ;
                                k <= 1 ;
                        end if;


                       
                    elsif k = 1 then
                        
                          if type1 = '0' then
                            rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                          else 
                             a5 <= to_integer(unsigned(data));
                                type1 <= '0';
                                  k <= 2 ;
                                   new_sig <= i+ 64 ;
                          end if ;
                             
                       
                         
                        
                    elsif k = 2 then
                        if(new_sig >= 0 and new_sig < 4096) then
                             if type1 = '0' then
                             rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                             a6 <= to_integer(unsigned(data));
                                type1 <= '0';
                                new_sig <= i-65 ;
                                k <= 3 ;
                             end if ;
                        else
                             a6 <= 0 ;
                              new_sig <= i-65 ;
                              k <= 3 ;
                        end if;
                      
                    elsif k = 3 then
                         if(new_sig >= 0 and new_sig < 4096) then
                             if type1 = '0' then
                             rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                             a1 <= to_integer(unsigned(data));
                                type1 <= '0';
                                 new_sig <= i-1 ;
                                  k <= 4 ;
                             end if ;
                        else
                             a1 <= 0 ;
                             new_sig <= i-1 ;
                             k <= 4 ;
                        end if;
                       
                    elsif k = 4 then
                        if(new_sig >= 0 and new_sig < 4096) then
                             if type1 = '0' then
                             rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                                a2 <= to_integer(unsigned(data));
                                type1 <= '0';
                                 new_sig <= i+ 63 ;
                                 k <= 5 ;
                             end if ;
                        else
                              a2 <= 0;
                              new_sig <= i+ 63 ;
                              k <= 5 ;
                        end if;
                       
                    elsif k = 5 then
                         if(new_sig >= 0 and new_sig < 4096) then
                            if type1 = '0' then
                              rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                                a3 <= to_integer(unsigned(data));
                                 type1 <= '0';
                                  new_sig <= i-63 ;
                                  k <= 6 ;
                             end if ;
                         else
                             a3 <= 0 ;
                             new_sig <= i-63 ;
                             k <= 6 ;
                         end if;
                       
                    elsif k = 6 then
                         if(new_sig >= 0 and new_sig < 4096) then
                            if type1 = '0' then
                              rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                                a7 <= to_integer(unsigned(data));
                                 type1 <= '0';
                                  new_sig <= i+ 1 ;
                                  k <= 7 ;
                             end if ;
                        else
                            a7 <=0;
                            new_sig <= i+ 1 ;
                            k <= 7 ;
                        end if;
                         
                    elsif k = 7 then
                         if(new_sig >= 0 and new_sig < 4096) then
                           if type1 = '0' then
                              rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                                a8 <= to_integer(unsigned(data));
                                 type1 <= '0';
                                  k <= 8 ;
                                new_sig <= i+ 65 ;
                              end if ;
                        else
                            a8 <= 0 ;
                             k <= 8 ;
                        new_sig <= i+ 65 ;
                        end if;
                         
                    elsif k = 8 then
                         if(new_sig >= 0 and new_sig < 4096) then
                             if type1 = '0' then
                              rdaddress <= std_logic_vector(to_unsigned(new_sig,12));
                                type1 <= '1';
                             else 
                                a9 <= to_integer(unsigned(data));
                                 type1 <= '0';
                                  k <= 9 ;
                               new_sig <= new_sig - 128;
                              end if ;
                        else
                            a9 <= 0 ;
                            k <= 9 ;
                           new_sig <= new_sig - 128;
                        end if;
                         
                    end if;

            
                    if k = 9 then









                        if(i mod 64 = 0) then
                            a1 <= 0;
                            a2 <= 0;
                            a3 <= 0;
                       
                        end if;

                      
                        if ( i mod 64 = 63) then
                            a7 <= 0;
                            a8 <= 0;
                            a9 <= 0;
                       
                        end if;



                        --                if ( j mod 64 = 63) then

                        --                    a3 <= 0;

                        --                elsif ( j mod 64 = 0) then

                        --                    a1 <= 0;

                        --                end if;

                        --                a4 <= a3 - 2*a2 + a1;
                        k <= k+1;
                 end if ;       
             if k = 10 then
                       if type1 = '0' then 
                        calc <= f1*a1 + f2*a2 + f3*a3 + f4*a4 + f5*a5 + f6*a6 + f7*a7 + f8*a8 + f9*a9;
                          type1 <= '1' ; 
                          
                        else 
                           type1 <= '0' ; 
                        if( to_integer(signed(max)) < calc ) then
                            max <= std_logic_vector(to_signed(calc,20));
                        end if;

                        if( to_integer(signed(min)) > calc ) then
                            min <= std_logic_vector(to_signed(calc,20));
                        end if;

                        --                    if ( calc< 0 ) then

                        --                        calc <= 0;

                        --                    elsif ( calc > 64) then

                        --                        calc <= 64;

                        --                    end if;

                        --                j <= j+1;


                            
                     
       
                        calculated <= std_logic_vector(to_signed(calc, 20));






                        --                data2 <= data3;

                        --                data1 <= data2;

                        --                data_in <= data4;



                        i <= i+1;

                        if i = 4096 then
--                            startNorm <= 1;
                            i <= 0;
                            wr <= '0';
                            N <= 1;
                            difference <= to_integer(signed(max)) - to_integer(signed(min));

                             
                        end if ;

                        k <= 0;
                        end if ;
                    end if;


                end if;
            elsif N = 1 then
            
                  if(i<4096) then
                  
                if anup =1 then
                    rdaddress <= std_logic_vector(to_unsigned(i,12));
                    anup <= anup + 1;
                elsif anup = 2 then
                    normValue <= (to_integer(signed(data_out)) -   to_integer(signed(min)))*255/difference;
                    wr <= '1';
                    anup <= anup +1;
                else
                    rdaddress <=std_logic_vector(to_unsigned(i,12));
                    calculated <= std_logic_vector(to_unsigned(normValue,20));
                    wr <= '0';
                    anup <=1;
                end if;
                
              end if;
               
            else 
               
               
               
                
            end if ;
          
        end if;



    end process;

--    norm : process(startNorm)
--    begin
--        if(startNorm = 1) then
--            if(i<4096) then
--                if anup =1 then
--                    rdaddress <= std_logic_vector(to_unsigned(i,12));
--                    anup <= anup + 1;
--                elsif anup = 2 then
--                    normValue <= (to_integer(signed(data_out)) - to_integer(signed(min)))*255/difference;
--                    wr <= '1';
--                    anup <= anup +1;
--                else
--                    rdaddress <=std_logic_vector(to_unsigned(i,12));
--                    calculated <= std_logic_vector(to_unsigned(normValue,20));
--                    wr <= '0';
--                    anup <=1;
--                end if;
--            end if;
--        end if;
--    end process;




    Horizontal_position_counter : process(clk25 ,RST)

    begin

        if ( wr = '0') then

            if(RST = '1') then

                hpos <= 0 ;

            elsif (clk25'event and clk25 = '1') then

                if (hPos = HD + HFP + HSP + HBP) then

                    hPos <= 0;

                else

                    hPos <= hPos + 1;

                end if;

            end if;

        else

            hpos <= 0 ;

        end if;

    end process;



    Vertical_position_counter : process(clk25 ,RST , hPos)

    begin

        if ( wr = '0' ) then

            if(RST = '1') then

                vPos <= 0 ;

            elsif (clk25'event and clk25 = '1') then

                if (hPos = HD + HFP + HSP + HBP) then

                    if (vPos = VD + VFP + VSP + VBP) then

                        vPos <= 0;

                    else

                        vPos <= vPos + 1;

                    end if;

                end if;

            end if;

        else

            vPos <= 0 ;

        end if;



    end process;



    Horizonal_Synchronisation : process(clk25,RST,hPos)

    begin

        if (wr =  '0') then

            if(RST = '1') then

                HSYNC <= '0' ;

            elsif(clk25'event and clk25 = '1') then

                if( hPos <= (HD + HFP) or (hPos > HD + HFP + HSP)) then

                    HSYNC <= '1';

                else

                    HSYNC  <= '0';

                end if ;

            end if;

        else

            HSYNC <= '0';

        end if;

    end process;



    Vertical_Synchronisation : process(clk25,RST,vPos)

    begin

        if ( wr = '0') then

            if(RST = '1') then

                VSYNC <= '0' ;

            elsif(clk25'event and clk25 = '1') then

                if( vPos <= (VD + VFP) or (vPos > VD + VFP + VSP)) then

                    VSYNC <= '1';

                else

                    VSYNC  <= '0';

                end if ;

            end if;

        else

            VSYNC <= '0';

        end if;

    end process;



    video_on : process(clk25, RST, hPos ,vPos)

    begin



        if(RST = '1') then

            videoOn <= '0';

        elsif(clk25'event and clk25 = '1') then

            if(hPos <= HD and vPos <= VD ) then

                videoOn <= '1';

            else

                videoOn <= '0';

            end if;

        end if;



    end process;



    draw :  process(clk25 , RST, hPos, vPos, videoOn)

    begin

        if ( wr = '0') then

            if(RST = '1') then

                vgaRed <= "0000";

                vgaBlue <= "0000";

                vgaGreen <= "0000";

            elsif(clk25'event and clk25 = '1') then

                if( videoOn = '1') then

                    if ((hPos >= 0 and hPos < 64)AND(vPos >= 0 and vPos < 64 )) then



                        vgaRed <= data_out(7 downto 4);
                        vgaBlue <= data_out(7 downto 4);
                        vgaGreen <= data_out(7 downto 4);

                    else

                        vgaRed <= "0000";

                        vgaBlue <= "0000";

                        vgaGreen <= "0000";

                    end if;

                else





                    vgaRed <= "0000";

                    vgaBlue <= "0000";

                    vgaGreen <= "0000";

                end if;

            end if;

        else

            vgaRed <= "0000";

            vgaBlue <= "0000";

            vgaGreen <= "0000";

        end if;

    end process;



end;