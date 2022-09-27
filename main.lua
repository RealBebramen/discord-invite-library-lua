local Inviter = {}

function linkinv(invite)
  local Inv = invite
  if invite and type(invite) == 'string' and invite:match('%a') then
      Inv = invite
      data_url = 'https://discord.com/api/v6/invite/'..Inv
  else
      Inv = table.concat(Inv)
      data_url = 'https://discord.com/api/v6/invite/'..Inv
  end

  ServerInfo = request({
      Url = 'https://discord.com/api/v6/invite/'..Inv,
      Method = 'GET'
  })
  request(
      {
          Url = 'http://127.0.0.1:6463/rpc?v=1',
          Method = 'POST',
          Headers = {
              ['Content-Type'] = 'application/json',
              ['origin'] = 'https://ptb.discord.com',
          },
          Body = game:GetService('HttpService'):JSONEncode({
              ['args'] = {
              ['code'] = Inv,
              ['sex'] = '?species=Goblin&realm=Toril'
          },
          ['cmd'] = 'INVITE_BROWSER',
          ['nonce'] = 'OwO'
      })
  })
end

return Inviter;
