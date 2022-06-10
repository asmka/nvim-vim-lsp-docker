FROM alpine:3.16.0

RUN apk add neovim
RUN apk add git
RUN apk add go

# # Create a group and user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
WORKDIR /home/appuser

# Place setting files
COPY --chown=appuser:appgroup init.lua .config/nvim/
COPY --chown=appuser:appgroup vim-lsp-settings/ .local/share/vim-lsp-settings

# Install Packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim .local/share/nvim/site/pack/packer/start/packer.nvim
RUN nvim --headless +'au User PackerComplete quitall' +'PackerInstall'

CMD ["/bin/sh"]
