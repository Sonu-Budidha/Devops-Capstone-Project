async function submitTicket() {
  await fetch("/api/ticket", {
    method: "POST",
    headers: {"Content-Type":"application/json"},
    body: JSON.stringify({
      title: title.value,
      description: desc.value
    })
  });
  alert("Ticket created");
}

