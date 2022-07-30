--[[
                                                                                                     
     ##### ##         ###              #######                                                       
  ######  /### /       ###           /       ###                          #                          
 /#   /  /  ##/         ##          /         ##                         ###                   #     
/    /  /    #          ##          ##        #                           #                   ##     
    /  /                ##           ###                                                      ##     
   ## ##   ###  /###    ##          ## ###           /###   ###  /###   ###        /###     ######## 
   ## ##    ###/ #### / ##           ### ###        / ###  / ###/ #### / ###      / ###  / ########  
   ## ###### ##   ###/  ##             ### ###     /   ###/   ##   ###/   ##     /   ###/     ##     
   ## #####  ##         ##               ### /##  ##          ##          ##    ##    ##      ##     
   ## ##     ##         ##                 #/ /## ##          ##          ##    ##    ##      ##     
   #  ##     ##         ##                  #/ ## ##          ##          ##    ##    ##      ##     
      #      ##         ##                   # /  ##          ##          ##    ##    ##      ##     
  /####      ##         ##         /##        /   ###     /   ##          ##    ##    ##      ##     
 /  #####    ###        ### /     /  ########/     ######/    ###         ### / #######       ##     
/    ###      ###        ##/     /     #####        #####      ###         ##/  ######         ##    
#                                |                                              ##                   
 ##                               \)                                            ##                   
                                                                                ##                   
                                                                                 ##                  
                             by https://github.com/Aydeniztr
--]]

function Main()
  menu = gg.choice({
    " Description (please read)",
    " Negative offset",
    " Vehicle height setting",
    " Exit"
  }, nil, [[
FRL DH Script Ver.1.0.1
by https://github.com/Aydeniztr]])
  if menu == 1 then
    D1()
  end
  if menu == 2 then
    D2()
  end
  if menu == 3 then
    D3()
  end
  if menu == 4 then
    D100()
  end
  Aydeniztr = -1
end

function D1()
  gg.alert("install red and white colored suspensions on your car and set the height lowest as you can to make this script work", "Ok")
  Aydeniztr = -1
end

function E1()
  gg.alert("Come back", "Understood")
  gg.processKill()
  os.exit()
end

function D2()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("-0.102334", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50)
  if 0 < gg.getResultCount() then
    gg.editAll("0", gg.TYPE_FLOAT)
    gg.toast("Offset release")
    gg.clearResults()
  else
    gg.searchNumber("h00000000CDCCCC3D00000000CDCCCC3D", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber("0", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(16)
    gg.editAll("125;-108;-47;-67;0;0;0;0", gg.TYPE_BYTE)
    gg.toast("Offset change complete")
    gg.clearResults()
  end
end

function D3()
  gg.clearResults()
  if gg.prompt({
    [1] = "Reset at 0: [-10; 3]"
  }, {nil}, {"number"}) == nil then
    return
  end
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("-10~3;4;5;8::13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("-10~3", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll(gg.prompt({
    [1] = "Reset with 0: [-10;3]"
  }, {nil}, {"number"})[1], gg.TYPE_DWORD)
  gg.clearResults()
  SM10()
end

function SM10()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h F6 FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,046,562,734", gg.TYPE_DWORD)
    gg.toast("-10")
    gg.clearResults()
  else
    SM9()
  end
end

function SM9()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h F7 FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,047,233,823", gg.TYPE_DWORD)
    gg.toast("-9")
    gg.clearResults()
  else
    SM8()
  end
end

function SM8()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h F8 FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,047,904,911", gg.TYPE_DWORD)
    gg.toast("-8")
    gg.clearResults()
  else
    SM7()
  end
end

function SM7()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h F9 FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,048,576,000", gg.TYPE_DWORD)
    gg.toast("-7")
    gg.clearResults()
  else
    SM6()
  end
end

function SM6()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h FF FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,048,911,544", gg.TYPE_DWORD)
    gg.toast("-6")
    gg.clearResults()
  else
    SM5()
  end
end

function SM5()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h FB FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,049,247,089", gg.TYPE_DWORD)
    gg.toast("-5")
    gg.clearResults()
  else
    SM4()
  end
end

function SM4()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h FC FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,049,582,633", gg.TYPE_DWORD)
    gg.toast("-4")
    gg.clearResults()
  else
    SM3()
  end
end

function SM3()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h FD FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,049,918,177", gg.TYPE_DWORD)
    gg.toast("-3")
    gg.clearResults()
  else
    SM2()
  end
end

function SM2()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h FE FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,050,253,722", gg.TYPE_DWORD)
    gg.toast("-2")
    gg.clearResults()
  else
    SM1()
  end
end

function SM1()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h FF FF FF FF 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,050,589,266", gg.TYPE_DWORD)
    gg.toast("-1")
    gg.clearResults()
  else
    SP0()
  end
end

function SP0()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h 00 00 00 00 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,050,924,810", gg.TYPE_DWORD)
    gg.toast("0")
    gg.clearResults()
  else
    SP1()
  end
end

function SP1()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h 01 00 00 00 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,051,260,355", gg.TYPE_DWORD)
    gg.toast("1")
    gg.clearResults()
  else
    SP2()
  end
end

function SP2()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h 02 00 00 00 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,051,595,899", gg.TYPE_DWORD)
    gg.toast("2")
    gg.clearResults()
  else
    SP3()
  end
end

function SP3()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("h 03 00 00 00 04 00 00 00 05 00 00 00 08 00 00 00", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
  if 0 < gg.getResultCount() then
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,046,562,734~1,051,931,443;1,056,293,520;1,052,266,988::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("1,046,562,734~1,051,931,443", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll("1,051,931,443", gg.TYPE_DWORD)
    gg.toast("3")
    gg.clearResults()
  else
    gg.clearresults()
    Main()
  end
end

function D100()
  print("by https://github.com/Aydeniztr")
  os.exit()
end

while true do
  if gg.isVisible(true) then
    Aydeniztr = 1
    gg.setVisible(false)
  end
  if Aydeniztr == 1 then
    Main()
  end
end
