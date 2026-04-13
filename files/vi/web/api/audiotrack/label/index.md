---
title: "AudioTrack: thuộc tính label"
short-title: label
slug: Web/API/AudioTrack/label
page-type: web-api-instance-property
browser-compat: api.AudioTrack.label
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`label`** của **{{domxref("AudioTrack")}}** trả về một chuỗi chỉ định nhãn dễ đọc cho con người của rãnh âm thanh, nếu có; nếu không, nó trả về một chuỗi rỗng.

## Giá trị

Một chuỗi chỉ định nhãn dễ đọc cho con người của rãnh, nếu có sẵn trong siêu dữ liệu của rãnh. Nếu không, một chuỗi rỗng (`""`) sẽ được trả về.

Ví dụ, một rãnh có {{domxref("AudioTrack.kind", "kind")}} là `"commentary"` có thể có `label` như `"Commentary with director Mark Markmarkimark and star Donna Donnalidon"`.

## Ví dụ

Ví dụ này trả về một mảng gồm loại và nhãn của các rãnh để có thể dùng trong giao diện người dùng chọn rãnh âm thanh cho một phần tử phương tiện được chỉ định. Danh sách được lọc để chỉ cho phép một số loại rãnh nhất định đi qua.

```js
function getTrackList(el) {
  const trackList = [];
  const wantedKinds = [
    "main",
    "alternative",
    "main-desc",
    "translation",
    "commentary",
  ];

  el.audioTracks.forEach((track) => {
    if (wantedKinds.includes(track.kind)) {
      trackList.push({
        id: track.id,
        kind: track.kind,
        label: track.label,
      });
    }
  });
  return trackList;
}
```

`trackList` kết quả chứa một mảng các rãnh âm thanh có `kind` là một trong các giá trị nằm trong mảng `wantedKinds`, trong đó mỗi mục cung cấp {{domxref("AudioTrack.id", "id")}}, {{domxref("AudioTrack.kind", "kind")}} và `label` của rãnh.

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
