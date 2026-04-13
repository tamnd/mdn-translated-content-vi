---
title: "VideoTrack: label property"
short-title: label
slug: Web/API/VideoTrack/label
page-type: web-api-instance-property
browser-compat: api.VideoTrack.label
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`label`** của **{{domxref("VideoTrack")}}** trả về chuỗi chỉ định nhãn có thể đọc được của video track, nếu có; ngược lại, nó trả về chuỗi rỗng.

## Giá trị

Chuỗi chỉ định nhãn có thể đọc được của track, nếu có trong metadata của track. Ngược lại, chuỗi rỗng (`""`) được trả về.

Ví dụ, một track có {{domxref("VideoTrack.kind", "kind")}} là `"sign"` có thể có `label` như `"A sign-language interpretation."`.

## Ví dụ

Ví dụ này trả về mảng các loại track và nhãn để có thể sử dụng trong giao diện người dùng để chọn video track cho phần tử media được chỉ định. Danh sách được lọc để chỉ cho phép một số loại track nhất định.

```js
function getTrackList(el) {
  const trackList = [];
  const wantedKinds = ["main", "alternative", "commentary"];

  el.videoTracks.forEach((track) => {
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

`trackList` kết quả chứa mảng các video track có `kind` là một trong những loại trong mảng `wantedKinds`, với mỗi mục cung cấp {{domxref("VideoTrack.id", "id")}}, {{domxref("VideoTrack.kind", "kind")}} và `label` của track.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
