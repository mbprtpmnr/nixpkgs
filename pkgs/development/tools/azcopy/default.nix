{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "azure-storage-azcopy";
  version = "10.12.2";

  src = fetchFromGitHub {
    owner = "Azure";
    repo = "azure-storage-azcopy";
    rev = "v${version}";
    sha256 = "sha256-NmWCaTmQlCAKaVDumDlubHQhUjhY7uYawkjrP2ggczk=";
  };

  subPackages = [ "." ];

  vendorSha256 = "sha256-4Jz57VjdQX+LJexEZau4pd8nIQPt0HGzCjHRj7uPox4=";

  doCheck = false;

  postInstall = ''
    ln -rs "$out/bin/azure-storage-azcopy" "$out/bin/azcopy"
  '';

  meta = with lib; {
    maintainers = with maintainers; [ colemickens ];
    license = licenses.mit;
    description = "The new Azure Storage data transfer utility - AzCopy v10";
  };
}
