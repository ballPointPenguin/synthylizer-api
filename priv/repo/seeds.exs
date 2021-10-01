# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Synthylizer.Repo.insert!(%Synthylizer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Synthylizer.Repo
alias Synthylizer.Instruments.{Synthesizer}
# alias Synthylizer.Accounts.User

#
# USERS
#

# richie =
#   %User{}
#   |> User.changeset(%{
#     username: "richie",
#     email: "richie@synthylizer.com",
#     password: "secretsauce"
#   })
#   |> Repo.insert!

# ellen =
#   %User{}
#   |> User.changeset(%{
#     username: "ellen",
#     email: "ellen@synthylizer.com",
#     password: "secretsauce"
#   })
#   |> Repo.insert!

# keith =
#   %User{}
#   |> User.changeset(%{
#     username: "keith",
#     email: "keith@synthylizer.com",
#     password: "secretsauce"
#   })
#   |> Repo.insert!

  #
  # Synthesizers
  #

  images_url = "#{SynthylizerWeb.Endpoint.url}/images"

  %Synthesizer{
    name: "Sub 37",
    slug: "sub-37",
    description: "A monophonic analog synthesizer manufactured by Moog Music from 2014.",
    keys: 37,
    polyphony: "Monophonic / Duophonic",
    release_year: 2014,
    synthesis_type: "Analog subtractive",
    image: "#{images_url}/sub-37.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "Mother-32",
    slug: "mother-32",
    description: "A semi-modular analog synthesizer. Introduced in 2015, it was the first tabletop unit produced by Moog Music.",
    keys: 0,
    polyphony: "Monophonic",
    release_year: 2015,
    synthesis_type: "Analog",
    image: "#{images_url}/mother-32.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "Minimoog",
    slug: "minimoog",
    description: "An analog synthesizer first manufactured by Moog Music between 1970 and 1981.",
    keys: 44,
    polyphony: "Monophonic",
    release_year: 1970,
    synthesis_type: "Analog subtractive",
    image: "#{images_url}/minimoog.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "Juno-106",
    slug: "juno-106",
    description: "A polyphonic synthesizer with six voices, released by the Roland Corporation in 1984.",
    keys: 61,
    polyphony: "6 voices",
    release_year: 1984,
    synthesis_type: "Analog subtractive",
    image: "#{images_url}/juno-106.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "MS-20",
    slug: "ms-20",
    description: "A patchable semi-modular monophonic analog synthesizer which Korg released in 1978.",
    keys: 37,
    polyphony: "Monophonic",
    release_year: 1978,
    synthesis_type: "Analog subtractive",
    image: "#{images_url}/ms-20.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "CS-80",
    slug: "cs-80",
    description: "An analog synthesizer released by Yamaha in 1977.",
    keys: 61,
    polyphony: "8 voices, dual layers",
    release_year: 1977,
    synthesis_type: "Analog subtractive",
    image: "#{images_url}/cs-80.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "",
    slug: "",
    description: "",
    keys: 0,
    polyphony: "",
    release_year: 1980,
    synthesis_type: "",
    image: "#{images_url}/synth.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "Wavestation",
    slug: "wavestation",
    description: "A vector synthesis synthesizer first produced in the early 1990s by Korg.",
    keys: 61,
    polyphony: "32",
    release_year: 1990,
    synthesis_type: "Digital vector subtractive",
    image: "#{images_url}/wavestation.png"
  } |> Repo.insert!

  %Synthesizer{
    name: "SH-101",
    slug: "sh-101",
    description: "An analog synthesizer manufactured by the Roland Corporation between 1982 and 1986.",
    keys: 32,
    polyphony: "Monophonic",
    release_year: 1982,
    synthesis_type: "Analog subtractive",
    image: "#{images_url}/sh-101.jpg"
  } |> Repo.insert!

  %Synthesizer{
    name: "ARP 2600",
    slug: "arp-2600",
    description: "The ARP 2600 is a semi-modular analog subtractive audio synthesizer produced by ARP Instruments, Inc.",
    keys: 49,
    polyphony: "Monophonic",
    release_year: 1971,
    synthesis_type: "Analog subtractive",
    image: "#{images_url}/arp-2600.jpg"
  } |> Repo.insert!
