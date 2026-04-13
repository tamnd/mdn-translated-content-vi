---
title: "SpeechSynthesis: phương thức getVoices()"
short-title: getVoices()
slug: Web/API/SpeechSynthesis/getVoices
page-type: web-api-instance-method
browser-compat: api.SpeechSynthesis.getVoices
---

{{APIRef("Web Speech API")}}

Phương thức **`getVoices()`** của giao diện {{domxref("SpeechSynthesis")}} trả về một danh sách các đối tượng {{domxref("SpeechSynthesisVoice")}} đại diện cho mọi voice có sẵn trên thiết bị hiện tại.

## Cú pháp

```js-nolint
getVoices()
```

### Tham số

Không có.

### Giá trị trả về

Một danh sách (mảng) các đối tượng {{domxref("SpeechSynthesisVoice")}}.

## Ví dụ

### JavaScript

```js
function populateVoiceList() {
  if (typeof speechSynthesis === "undefined") {
    return;
  }

  const voices = speechSynthesis.getVoices();

  for (const voice of voices) {
    const option = document.createElement("option");
    option.textContent = `${voice.name} (${voice.lang})`;

    if (voice.default) {
      option.textContent += " — DEFAULT";
    }

    option.setAttribute("data-lang", voice.lang);
    option.setAttribute("data-name", voice.name);
    document.getElementById("voiceSelect").appendChild(option);
  }
}

populateVoiceList();
if (
  typeof speechSynthesis !== "undefined" &&
  speechSynthesis.onvoiceschanged !== undefined
) {
  speechSynthesis.onvoiceschanged = populateVoiceList;
}
```

### HTML

```html
<select id="voiceSelect"></select>
```

{{EmbedLiveSample("Examples", 400, 25)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
