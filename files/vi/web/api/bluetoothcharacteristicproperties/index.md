---
title: BluetoothCharacteristicProperties
slug: Web/API/BluetoothCharacteristicProperties
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BluetoothCharacteristicProperties
---

{{APIRef("Bluetooth API")}}{{securecontext_header}}{{SeeCompatTable}}

Giao diện **`BluetoothCharacteristicProperties`** của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) cung cấp các thao tác hợp lệ trên {{domxref('BluetoothRemoteGATTCharacteristic')}} đã cho.

Giao diện này được trả về khi gọi {{DOMxRef("BluetoothRemoteGATTCharacteristic.properties")}}.

## Thuộc tính thực thể

- {{DOMxRef("BluetoothCharacteristicProperties.authenticatedSignedWrites","authenticatedSignedWrites")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép ghi có chữ ký vào giá trị của đặc tính.
- {{DOMxRef("BluetoothCharacteristicProperties.broadcast", "broadcast")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép phát quảng bá giá trị của đặc tính bằng Server Characteristic Configuration Descriptor.
- {{DOMxRef("BluetoothCharacteristicProperties.indicate","indicate")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép gửi indication cho giá trị của đặc tính kèm xác nhận.
- {{DOMxRef("BluetoothCharacteristicProperties.notify","notify")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép gửi notification cho giá trị của đặc tính mà không cần xác nhận.
- {{DOMxRef("BluetoothCharacteristicProperties.read", "read")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép đọc giá trị của đặc tính.
- {{DOMxRef("BluetoothCharacteristicProperties.reliableWrite","reliableWrite")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép ghi đáng tin cậy vào đặc tính.
- {{DOMxRef("BluetoothCharacteristicProperties.writableAuxiliaries","writableAuxiliaries")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép ghi đáng tin cậy vào bộ mô tả của đặc tính.
- {{DOMxRef("BluetoothCharacteristicProperties.write","write")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép ghi vào đặc tính có phản hồi.
- {{DOMxRef("BluetoothCharacteristicProperties.writeWithoutResponse","writeWithoutResponse")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một `boolean` có giá trị `true` nếu được phép ghi vào đặc tính mà không có phản hồi.

## Ví dụ

Ví dụ sau cho thấy cách xác định một đặc tính GATT có hỗ trợ thông báo thay đổi giá trị hay không.

```js
let device = await navigator.bluetooth.requestDevice({
  filters: [{ services: ["heart_rate"] }],
});
let gatt = await device.gatt.connect();
let service = await gatt.getPrimaryService("heart_rate");
let characteristic = await service.getCharacteristic("heart_rate_measurement");
if (characteristic.properties.notify) {
  characteristic.addEventListener(
    "characteristicvaluechanged",
    async (event) => {
      console.log(`Received heart rate measurement: ${event.target.value}`);
    },
  );
  await characteristic.startNotifications();
}
```

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
