---
title: "Bluetooth: phương thức requestDevice()"
short-title: requestDevice()
slug: Web/API/Bluetooth/requestDevice
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Bluetooth.requestDevice
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`Bluetooth.requestDevice()`** của giao diện {{domxref("Bluetooth")}} trả về một {{jsxref("Promise")}} hoàn tất với một đối tượng {{domxref("BluetoothDevice")}} khớp với các tùy chọn được chỉ định.
Nếu không có giao diện chọn thiết bị, phương thức này sẽ trả về thiết bị đầu tiên khớp với tiêu chí.

## Cú pháp

```js-nolint
requestDevice()
requestDevice(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng thiết lập các tùy chọn để chọn một thiết bị phù hợp.
    Các tùy chọn hiện có gồm:
    - `filters` {{optional_inline}}
      - : Một mảng các đối tượng bộ lọc chỉ ra các thuộc tính của thiết bị sẽ được so khớp.
        Để khớp với một đối tượng bộ lọc, thiết bị phải khớp với tất cả các giá trị trong bộ lọc: mọi `services`, `name`, `namePrefix` đã chỉ định, v.v.

        Mỗi bộ lọc gồm một đối tượng có các thuộc tính sau:
        - `services` {{optional_inline}}
          - : Một mảng các giá trị cho biết các dịch vụ Bluetooth GATT (Generic Attribute Profile) mà một thiết bị Bluetooth phải hỗ trợ.
            Mỗi giá trị có thể là một tên hợp lệ trong [danh sách dịch vụ GATT được gán](https://github.com/WebBluetoothCG/registries/blob/master/gatt_assigned_services.txt), chẳng hạn như `'battery_service'` hoặc `'blood_pressure'`.
            Bạn cũng có thể truyền một UUID dịch vụ đầy đủ như `'0000180F-0000-1000-8000-00805f9b34fb'` hoặc bí danh ngắn 16-bit (`0x180F`) hay 32-bit.
            Lưu ý rằng đây cũng là các giá trị có thể truyền cho {{domxref("BluetoothUUID/getService_static","BluetoothUUID.getService()")}}.

        - `name` {{optional_inline}}
          - : Một chuỗi chứa chính xác tên của thiết bị cần so khớp.
        - `namePrefix` {{optional_inline}}
          - : Một chuỗi chứa tiền tố tên cần so khớp.
            Tất cả các thiết bị có tên bắt đầu bằng chuỗi này sẽ được khớp.
        - `manufacturerData` {{optional_inline}}
          - : Một mảng các đối tượng dùng để so khớp với dữ liệu nhà sản xuất trong các gói quảng bá Bluetooth Low Energy (BLE). <!-- BluetoothManufacturerDataFilterInit -->
            Mỗi đối tượng bộ lọc có các thuộc tính sau:
            - `companyIdentifier`
              - : Một số bắt buộc để nhận diện nhà sản xuất của thiết bị.
                Các mã nhận diện công ty được liệt kê trong [Assigned numbers](https://www.bluetooth.com/specifications/assigned-numbers/) của đặc tả Bluetooth, Mục 7.
                Ví dụ: để so khớp với thiết bị do "Digianswer A/S" sản xuất, có mã hexa được gán là `0x000C`, bạn sẽ chỉ định `12`.
            - `dataPrefix` {{optional_inline}}
              - : Tiền tố dữ liệu.
                Một bộ đệm chứa các giá trị để so khớp với các giá trị ở đầu dữ liệu quảng bá của nhà sản xuất.
            - `mask` {{optional_inline}}
              - : Cho phép bạn so khớp với các byte trong dữ liệu nhà sản xuất bằng cách áp dụng mặt nạ lên một số byte của dữ liệu dịch vụ `dataPrefix`.

        - `serviceData` {{optional_inline}} <!-- BluetoothServiceDataFilterInit -->
          - : Một mảng các đối tượng dùng để so khớp với dữ liệu dịch vụ trong các gói quảng bá Bluetooth Low Energy (BLE). <!-- BluetoothServiceDataFilterInit -->
            Mỗi đối tượng bộ lọc có các thuộc tính sau:
            - `service`
              - : Tên dịch vụ GATT, UUID dịch vụ, hoặc dạng UUID 16-bit hay 32-bit.
                Thuộc tính này nhận cùng các giá trị như các phần tử của mảng [`services`](#services).
            - `dataPrefix` {{optional_inline}}
              - : Tiền tố dữ liệu.
                Một bộ đệm chứa các giá trị để so khớp với các giá trị ở đầu dữ liệu quảng bá của dịch vụ.
            - `mask` {{optional_inline}}
              - : Cho phép bạn so khớp với các byte trong dữ liệu dịch vụ bằng cách áp dụng mặt nạ lên một số byte của dữ liệu dịch vụ `dataPrefix`.

    - `exclusionFilters` {{optional_inline}}
      - : Một mảng các đối tượng bộ lọc chỉ ra các đặc tính của thiết bị sẽ bị loại khỏi việc so khớp.
        Các thuộc tính của phần tử trong mảng giống với [`filters`](#filters).
    - `optionalServices` {{optional_inline}}
      - : Một mảng các mã định danh dịch vụ tùy chọn.

        Các mã định danh nhận cùng các giá trị như các phần tử của mảng [`services`](#services) (tên dịch vụ GATT, UUID dịch vụ, hoặc dạng UUID ngắn 16-bit hay 32-bit).

    - `optionalManufacturerData` {{optional_inline}}
      - : Một mảng tùy chọn các mã số nguyên của nhà sản xuất.
        Giá trị này nhận cùng các giá trị như [`companyIdentifier`](#companyidentifier).

        Dữ liệu này không được dùng để lọc thiết bị, nhưng các quảng bá khớp với tập đã chỉ định vẫn sẽ được chuyển tới trong các sự kiện `advertisementreceived`.
        Điều này hữu ích vì nó cho phép mã chỉ định mối quan tâm đến dữ liệu nhận từ các thiết bị Bluetooth mà không ràng buộc bộ lọc kiểm soát những thiết bị nào được hiển thị cho người dùng trong lời nhắc cấp quyền.

    - `acceptAllDevices` {{optional_inline}}
      - : Một giá trị boolean cho biết script yêu cầu có thể chấp nhận mọi thiết bị Bluetooth.
        Giá trị mặc định là `false`.

        Tùy chọn này phù hợp khi thiết bị không quảng bá đủ thông tin để việc lọc trở nên hữu ích.
        Khi `acceptAllDevices` được đặt thành `true`, bạn nên bỏ qua toàn bộ [`filters`](#filters) và [`exclusionFilters`](#exclusionfilters), đồng thời phải đặt [`optionalServices`](#optionalservices) để có thể _sử dụng_ thiết bị được trả về.

Sau khi người dùng chọn một thiết bị để ghép đôi trong origin hiện tại, thiết bị đó chỉ được phép truy cập các dịch vụ có UUID đã được liệt kê trong danh sách dịch vụ của bất kỳ phần tử nào trong [`filters.services`](#services) hoặc trong [`optionalServices`](#optionalservices).
Vì vậy, việc liệt kê các dịch vụ cần thiết là rất quan trọng.
Đặc biệt, khi chỉ lọc bằng [`name`](#name), bạn phải nhớ chỉ định thêm các dịch vụ mong muốn trong [`optionalServices`](#optionalservices).

> [!NOTE]
> Mặc dù đối số `options` về mặt kỹ thuật là tùy chọn, để trả về bất kỳ kết quả nào bạn vẫn phải đặt giá trị cho `filters` hoặc đặt `acceptAllDevices` thành `true`.

### Giá trị trả về

Một {{jsxref("Promise")}} tới một đối tượng {{domxref("BluetoothDevice")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `options` được cung cấp là không hợp lệ.
    Ví dụ: nếu `options.filters` hiện diện và `options.acceptAllDevices` là `true`, `options.filters` không hiện diện và `options.acceptAllDevices` là `false`, hoặc `options.filters` là `[]`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu không có thiết bị Bluetooth nào khớp với các tùy chọn được chỉ định.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu thao tác này không được phép trong ngữ cảnh hiện tại do [các cân nhắc về bảo mật](/en-US/docs/Web/API/Web_Bluetooth_API#security_considerations), chẳng hạn như khi được gọi từ một origin không bảo mật.

## Ví dụ

```js
// Discovery options match any devices advertising:
// - The standard heart rate service.
// - Both 16-bit service IDs 0x1802 and 0x1803.
// - A proprietary 128-bit UUID service c48e6067-5295-48d3-8d5c-0395f61792b1.
// - Devices with name "ExampleName".
// - Devices with name starting with "Prefix".
//
// And enables access to the battery service if devices
// include it, even if devices do not advertise that service.
let options = {
  filters: [
    { services: ["heart_rate"] },
    { services: [0x1802, 0x1803] },
    { services: ["c48e6067-5295-48d3-8d5c-0395f61792b1"] },
    { name: "ExampleName" },
    { namePrefix: "Prefix" },
  ],
  optionalServices: ["battery_service"],
};

navigator.bluetooth
  .requestDevice(options)
  .then((device) => {
    console.log(`Name: ${device.name}`);
    // Do something with the device.
  })
  .catch((error) => console.error(`Something went wrong. ${error}`));
```

[Ví dụ chi tiết](https://webbluetoothcg.github.io/web-bluetooth/#example-filter-by-services) có trong đặc tả và cũng có trong [Communicating with Bluetooth devices over JavaScript](https://developer.chrome.com/docs/capabilities/bluetooth) trên _developer.chrome.com_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Communicating with Bluetooth devices over JavaScript](https://developer.chrome.com/docs/capabilities/bluetooth) trên _developer.chrome.com_.
