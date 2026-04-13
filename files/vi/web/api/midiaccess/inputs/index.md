---
title: "MIDIAccess: thuộc tính inputs"
short-title: inputs
slug: Web/API/MIDIAccess/inputs
page-type: web-api-instance-property
browser-compat: api.MIDIAccess.inputs
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`inputs`** của giao diện {{domxref("MIDIAccess")}} cung cấp quyền truy cập vào bất kỳ cổng đầu vào MIDI nào có sẵn.

## Giá trị

Một phiên bản {{domxref("MIDIInputMap")}}.

## Ví dụ

Phương thức {{domxref("Navigator.requestMIDIAccess()")}} trả về một promise phân giải thành đối tượng {{domxref("MIDIAccess")}}. In giá trị của `inputs` ra bảng điều khiển sẽ trả về một {{domxref("MIDIInputMap")}}.

```js
navigator.requestMIDIAccess().then((access) => {
  console.log(access.inputs);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
