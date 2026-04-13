---
title: "MIDIAccess: thuộc tính sysexEnabled"
short-title: sysexEnabled
slug: Web/API/MIDIAccess/sysexEnabled
page-type: web-api-instance-property
browser-compat: api.MIDIAccess.sysexEnabled
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`sysexEnabled`** của giao diện {{domxref("MIDIAccess")}} cho biết liệu hỗ trợ system exclusive có được bật trên phiên bản MIDIAccess hiện tại hay không.

## Giá trị

Một giá trị boolean.

## Ví dụ

Phương thức {{domxref("Navigator.requestMIDIAccess()")}} trả về một promise phân giải thành đối tượng {{domxref("MIDIAccess")}}. In giá trị của `sysexEnabled` ra bảng điều khiển sẽ trả về một giá trị boolean, là `true` nếu hỗ trợ system exclusive được bật.

```js
navigator.requestMIDIAccess().then((access) => {
  console.log(access.sysexEnabled);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
