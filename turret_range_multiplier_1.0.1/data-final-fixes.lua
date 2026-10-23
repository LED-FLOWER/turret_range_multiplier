
local multiplier = settings.startup["turret-range-multiplier"].value

-- Turret prototype types to process.
local turret_types = {
  "ammo-turret",
  "electric-turret",
  "fluid-turret",
  "artillery-turret"
}

for _, turret_type in ipairs(turret_types) do
  local prototypes = data.raw[turret_type]

  if prototypes then
    for name, turret in pairs(prototypes) do
      local attack = turret.attack_parameters

      if attack and type(attack.range) == "number" then
        local original_range = attack.range
        attack.range = original_range * multiplier

        log(
          "[Turret Range Multiplier] "
          .. name
          .. ": "
          .. original_range
          .. " -> "
          .. attack.range
        )
      end
    end
  end
end
