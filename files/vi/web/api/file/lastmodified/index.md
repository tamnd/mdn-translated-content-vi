---
title: "File: lastModified property"
short-title: lastModified
slug: Web/API/File/lastModified
page-type: web-api-instance-property
browser-compat: api.File.lastModified
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`lastModified`** của giao diện {{domxref("File")}} cung cấp ngày sửa đổi cuối cùng của tệp dưới dạng số mili giây kể từ epoch Unix (1 tháng 1 năm 1970, nửa đêm). Các tệp không có ngày sửa đổi cuối cùng sẽ trả về ngày hiện tại.

## Giá trị

Một số đại diện cho số mili giây kể từ epoch Unix.

## Ví dụ

Ví dụ dưới đây sẽ lặp qua các tệp bạn chọn và in ra xem mỗi tệp có được sửa đổi trong năm qua hay không.

### HTML

```html
<input type="file" id="file-picker" name="fileList" multiple />
<output id="output"></output>
```

```css hidden
output {
  display: block;
  white-space: pre-wrap;
}
```

### JavaScript

```js
const output = document.getElementById("output");
const filePicker = document.getElementById("file-picker");

filePicker.addEventListener("change", (event) => {
  const files = event.target.files;
  const now = new Date();
  output.textContent = "";

  for (const file of files) {
    const date = new Date(file.lastModified);
    // true if the file hasn't been modified for more than 1 year
    const stale = now.getTime() - file.lastModified > 31_536_000_000;
    output.textContent += `${file.name} is ${
      stale ? "stale" : "fresh"
    } (${date}).\n`;
  }
});
```

### Kết quả

{{EmbedLiveSample('Examples')}}

### Các tệp được tạo động

Nếu một tệp được tạo động, thời gian sửa đổi cuối cùng có thể được cung cấp trong hàm khởi tạo {{domxref("File.File()", "File()")}}. Nếu không có, `lastModified` sẽ kế thừa thời gian hiện tại từ {{jsxref("Date.now()")}} vào thời điểm đối tượng `File` được tạo.

```js
const fileWithDate = new File([], "file.bin", {
  lastModified: new Date(2017, 1, 1),
});
console.log(fileWithDate.lastModified); // returns 1485903600000

const fileWithoutDate = new File([], "file.bin");
console.log(fileWithoutDate.lastModified); // returns current time
```

## Độ chính xác thời gian bị giảm

Để bảo vệ chống lại các cuộc tấn công thời gian và [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `someFile.lastModified` có thể bị làm tròn tùy thuộc vào cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật theo mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, trong trường hợp đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy theo giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian bị giảm, kết quả của `someFile.lastModified` sẽ luôn là bội số của 2, hoặc bội số của 100 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi bật `privacy.resistFingerprinting`.

```js
// reduced time precision (2ms) in Firefox 60
someFile.lastModified;
// Might be:
// 1519211809934
// 1519211810362
// 1519211811670
// …

// reduced time precision with `privacy.resistFingerprinting` enabled
someFile.lastModified;
// Might be:
// 1519129853500
// 1519129858900
// 1519129864400
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("File")}}
