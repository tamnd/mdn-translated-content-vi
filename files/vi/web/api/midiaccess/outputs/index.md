---
title: "MIDIAccess: thuộc tính outputs"
short-title: outputs
slug: Web/API/MIDIAccess/outputs
page-type: web-api-instance-property
browser-compat: api.MIDIAccess.outputs
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`outputs`** của giao diện {{domxref("MIDIAccess")}} cung cấp quyền truy cập vào bất kỳ cổng đầu ra MIDI nào có sẵn.

## Giá trị

Một phiên bản {{domxref("MIDIOutputMap")}}.

## Ví dụ

Phương thức {{domxref("Navigator.requestMIDIAccess()")}} trả về một promise phân giải thành đối tượng {{domxref("MIDIAccess")}}. In giá trị của `outputs` ra bảng điều khiển sẽ trả về một {{domxref("MIDIOutputMap")}}.

```js
navigator.requestMIDIAccess().then((access) => {
  console.log(access.outputs);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
