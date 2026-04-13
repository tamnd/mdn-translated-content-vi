---
title: "AudioTrack: thuộc tính language"
short-title: language
slug: Web/API/AudioTrack/language
page-type: web-api-instance-property
browser-compat: api.AudioTrack.language
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`language`** của **{{domxref("AudioTrack")}}** trả về một chuỗi xác định ngôn ngữ được dùng trong rãnh âm thanh.

Đối với các rãnh bao gồm nhiều ngôn ngữ (chẳng hạn như một bộ phim bằng tiếng Anh nhưng có một vài câu thoại bằng các ngôn ngữ khác), đây phải là ngôn ngữ chính của video.

## Giá trị

Một chuỗi chỉ định {{glossary("BCP 47 language tag")}} của ngôn ngữ chính được dùng trong rãnh âm thanh, hoặc một chuỗi rỗng (`""`) nếu ngôn ngữ không được chỉ định hoặc không xác định, hoặc nếu rãnh không chứa lời nói.

Ví dụ, nếu ngôn ngữ chính được dùng trong rãnh là tiếng Anh Mỹ, giá trị này sẽ là `"en-US"`. Với tiếng Bồ Đào Nha Brazil, giá trị sẽ là `"pt-BR"`.

## Ví dụ

Ví dụ này xác định tất cả các rãnh âm thanh ngôn ngữ chính và rãnh âm thanh bản dịch của một phần tử phương tiện rồi trả về danh sách các đối tượng chứa {{domxref("AudioTrack.id", "id")}}, {{domxref("AudioTrack.kind", "kind")}} và `language` của từng rãnh đó.

Sau đó, danh sách này có thể được dùng để xây dựng giao diện người dùng nhằm chọn ngôn ngữ mà người dùng muốn nghe khi xem phim, chẳng hạn.

```js
function getAvailableLanguages(el) {
  const trackList = [];
  const wantedKinds = ["main", "translation"];

  el.audioTracks.forEach((track) => {
    if (wantedKinds.includes(track.kind)) {
      trackList.push({
        id: track.id,
        kind: track.kind,
        language: track.language,
      });
    }
  });
  return trackList;
}
```

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
