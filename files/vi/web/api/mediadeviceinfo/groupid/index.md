---
title: "MediaDeviceInfo: thuộc tính groupId"
short-title: groupId
slug: Web/API/MediaDeviceInfo/groupId
page-type: web-api-instance-property
browser-compat: api.MediaDeviceInfo.groupId
---

{{APIRef("Media Capture and Streams")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`groupId`** của giao diện {{domxref("MediaDeviceInfo")}} trả về một chuỗi là định danh nhóm.

Hai thiết bị có cùng định danh nhóm nếu chúng thuộc cùng một thiết bị vật lý; ví dụ, một màn hình có cả camera và microphone tích hợp.

## Giá trị

Một chuỗi nhận dạng duy nhất nhóm các thiết bị liên quan mà thiết bị này thuộc về.

## Ví dụ

Trong ví dụ này, chúng ta tập hợp danh sách các thiết bị là một phần của cùng nhóm với một thiết bị cho trước. Điều này có thể được sử dụng để tạo ra giao diện người dùng tập hợp các thiết bị liên quan lại với nhau cho mục đích trình bày, hoặc để giúp người dùng dễ dàng chọn sử dụng camera và microphone tích hợp trên cùng một màn hình cùng lúc.

```js
const getDeviceGroup = (mainDevInfo) => {
  let devList = [];

  navigator.mediaDevices.enumerateDevices().then((devices) => {
    devices.forEach((device) => {
      if (device.groupId === mainDevInfo.groupId) {
        devList.push(device);
      }
    });
  });

  return devList;
};
```

Hàm `getDeviceGroup()` nhận đầu vào là đối tượng `MediaDeviceInfo` mô tả thiết bị cần xây dựng danh sách nhóm. Hàm bắt đầu bằng cách khởi tạo mảng kết quả `devList` thành mảng rỗng.

Sau đó {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}} được gọi để lấy danh sách tất cả thiết bị media. Khi promise được giải quyết, chúng ta duyệt qua danh sách bằng {{jsxref("Array.forEach", "forEach()")}}. Với mỗi thiết bị, nếu `groupId` của nó khớp với `groupId` của thiết bị chính, chúng ta đẩy đối tượng {{domxref("MediaDeviceInfo")}} vào danh sách.

Cuối cùng, danh sách chứa đối tượng `MediaDeviceInfo` cho mỗi thiết bị trong cùng nhóm được trả về cho người gọi.

Phiên bản khác của ví dụ này đặt thiết bị được truyền vào ở đầu danh sách kết quả, sau đó thêm bất kỳ thành viên nào khác của nhóm được tìm thấy:

```js
const getDeviceGroup = (mainDevInfo) => {
  let devList = [mainDevInfo];

  navigator.mediaDevices.enumerateDevices().then((devices) => {
    devices.forEach((device) => {
      if (
        device.groupId === mainDevInfo.groupId &&
        device.deviceId !== mainDevInfo.deviceId
      ) {
        devList.push(device);
      }
    });
  });

  return devList;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
