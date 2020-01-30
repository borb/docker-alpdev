FROM        alpine:3.11

RUN			["apk", "update"]
RUN			["apk", "add", \
				"binutils", \
				"cgdb", \
				"clang", \
				"clang-analyzer", \
				"cmake", \
				"gcc", \
				"gcc-zsh-completion", \
				"gcc-objc", \
				"gdb", \
				"g++", \
				"git", \
				"git-diff-highlight", \
				"git-doc", \
				"git-lfs", \
				"git-lfs-doc", \
				"git-perl", \
				"git-subtree", \
				"git-subtree-doc", \
				"git-zsh-completion", \
				"grep", \
				"less", \
				"libusb-dev", \
				"libusb-compat-dev", \
				"make", \
				"man", \
				"man-pages", \
				"musl-dev", \
				"musl-utils", \
				"ncurses", \
				"neovim", \
				"nodejs-current", \
				"npm", \
				"openssh", \
				"openssh-server", \
				"pkgconf", \
				"protobuf-dev", \
				"protobuf-c-dev", \
				"rsync", \
				"tar", \
				"zsh" \
			]

RUN			["adduser", "-D", "-H", "-s", "/bin/zsh", "-h", "/home/devuser", "devuser"]
RUN			["ash", "-c", "echo -n 'devuser:*' | chpasswd -e"]

COPY		["docker-entry.sh", "/root/docker-entry.sh"]
RUN			["chmod", "755", "/root/docker-entry.sh"]
ENTRYPOINT	["/root/docker-entry.sh"]

VOLUME		["/home/devuser"]
