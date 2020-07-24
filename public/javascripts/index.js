M.AutoInit();

function createUrlShortener () {
  document.querySelector("#generated-link-informations").style.display = "none";

  const currentLinkValue = document.querySelector("#input-link").value;
  const currentSlugValue = document.querySelector("#input-slug").value;

  if (!currentLinkValue && !currentSlugValue) {
    M.toast({ html: "Preencha os campos para continuar!" });
    return;
  }

  const data = {
    method: "POST",
    headers: new Headers({ 'Content-Type': 'application/json' }),
    body: JSON.stringify({
      slug: currentSlugValue,
      real_url: currentLinkValue
    })
  };

  fetch("/", data)
    .then((response) => {
      if (response.ok) {
        response
          .json()
          .then(data => showGeneratedLink(data))

        return;
      }

      M.toast({ html: "Houve um problema ao enviar os dados" });
    })
    .catch(() => M.toast({ html: "Houve um problema ao enviar os dados" }));
}

function showGeneratedLink (data) {
  const currentGeneratedUrl = `http://localhost:9393/${data.slug}`;

  const a = document.querySelector("#generated-link");
  a.href = currentGeneratedUrl;
  a.innerText = currentGeneratedUrl;

  document.querySelector("#generated-link-informations").style.display = "inline";
}

function copyLink () {
  const currentGeneratedUrl = document.querySelector("#generated-link").href;
  const textArea = document.createElement("textarea");
  textArea.value = currentGeneratedUrl;
  document.body.appendChild(textArea);
  textArea.select();
  document.execCommand("Copy");
  textArea.remove();
}