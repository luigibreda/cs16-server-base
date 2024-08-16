FROM kriansa/cs-16:latest

# Runtime settings
ENV MAXPLAYERS="24"

# Copy the files
COPY --chown=steam:steam cstrike/addons cstrike/addons
COPY --chown=steam:steam cstrike/cfgs cstrike/cfgs
COPY --chown=steam:steam cstrike/liblist.gam cstrike/mapcycle.txt \
  cstrike/*.cfg cstrike/motd.html cstrike/

# Copy the maps/textures/etc.
COPY --chown=steam:steam cstrike/maps cstrike_downloads/maps
COPY --chown=steam:steam cstrike/gfx cstrike_downloads/gfx
COPY --chown=steam:steam cstrike/*.wad cstrike_downloads/
COPY --chown=steam:steam cstrike/models cstrike_downloads/models
COPY --chown=steam:steam cstrike/sound cstrike_downloads/sound
COPY --chown=steam:steam cstrike/sprites cstrike_downloads/sprites

# Copiar arquivos do Zombie-Mod
COPY --chown=steam:steam cstrike/maps/z*.* cstrike/maps/
COPY --chown=steam:steam cstrike/models/zombie-mod cstrike/models/zombie-mod
COPY --chown=steam:steam cstrike/sound/zombie-mod cstrike/sound/zombie-mod
COPY --chown=steam:steam cstrike/sprites/zombie-mod cstrike/sprites/zombie-mod

CMD /home/steam/hlds/hlds_run -game cstrike +map zp_boss_city +ip 0.0.0.0 +maxplayers $MAXPLAYERS +exec server.cfg
