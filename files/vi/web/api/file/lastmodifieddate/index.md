---
title: "File: lastModifiedDate property"
short-title: lastModifiedDate
slug: Web/API/File/lastModifiedDate
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.File.lastModifiedDate
---

{{APIRef("File API")}}{{AvailableInWorkers}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`lastModifiedDate`** của giao diện {{domxref("File")}} trả về ngày sửa đổi cuối cùng của tệp. Các tệp không có ngày sửa đổi cuối cùng sẽ trả về ngày hiện tại.

## Giá trị

Một đối tượng {{JSXRef("Global_Objects/Date", "Date")}} cho biết ngày và giờ tệp được sửa đổi lần cuối.

## Ví dụ

```js
// fileInput is a HTMLInputElement: <input type="file" multiple id="my-file-input">
const fileInput = document.getElementById("my-file-input");

for (const file of fileInput.files) {
  console.log(
    `${file.name} has a last modified date of ${file.lastModifiedDate}`,
  );
}
```

## Độ chính xác thời gian bị giảm

Để bảo vệ chống lại các cuộc tấn công thời gian và [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `someFile.lastModifiedDate` có thể bị làm tròn tùy thuộc vào cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật theo mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, trong trường hợp đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy theo giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian bị giảm, kết quả của `someFile.lastModifiedDate.getTime()` sẽ luôn là bội số của 2, hoặc bội số của 100 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi bật `privacy.resistFingerprinting`.

```js
// reduced time precision (2ms) in Firefox 60
someFile.lastModifiedDate.getTime();
// Might be:
// 1519211809934
// 1519211810362
// 1519211811670
// …

// reduced time precision with `privacy.resistFingerprinting` enabled
someFile.lastModifiedDate.getTime();
// Might be:
// 1519129853500
// 1519129858900
// 1519129864400
// …
```

## Thông số kỹ thuật

_Mặc dù có mặt trong bản nháp đầu tiên của đặc tả File API, thuộc tính này đã bị xóa và hiện là phi tiêu chuẩn. Hãy sử dụng {{domxref("File.lastModified")}} thay thế._

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("File")}}
