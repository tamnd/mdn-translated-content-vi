---
title: "FileReader: thuộc tính result"
short-title: result
slug: Web/API/FileReader/result
page-type: web-api-instance-property
browser-compat: api.FileReader.result
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("FileReader")}} trả về nội dung của tệp. Thuộc tính này chỉ hợp lệ sau khi thao tác đọc hoàn tất, và định dạng dữ liệu phụ thuộc vào phương thức nào được dùng để khởi tạo thao tác đọc.

## Giá trị

Chuỗi hoặc {{jsxref("ArrayBuffer")}} phù hợp dựa trên phương thức đọc nào được dùng để khởi tạo thao tác đọc. Giá trị là `null` nếu việc đọc chưa hoàn tất hoặc không thành công.

Các loại kết quả được mô tả bên dưới.

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Phương thức</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        {{domxref("FileReader/readAsArrayBuffer", "readAsArrayBuffer()")}}
      </td>
      <td>
        <code>result</code> là một
        {{jsxref("Global_Objects/ArrayBuffer", "ArrayBuffer")}} JavaScript
        chứa dữ liệu nhị phân.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("FileReader/readAsBinaryString", "readAsBinaryString()")}}
      </td>
      <td>
        <code>result</code> chứa dữ liệu nhị phân thô từ tệp trong một
        chuỗi.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("FileReader/readAsDataURL", "readAsDataURL()")}}
      </td>
      <td>
        <code>result</code> là một chuỗi với URL <code>data:</code>
        đại diện cho dữ liệu tệp.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("FileReader/readAsText", "readAsText()")}}
      </td>
      <td><code>result</code> là văn bản trong một chuỗi.</td>
    </tr>
  </tbody>
</table>

## Ví dụ

Ví dụ này trình bày hàm `reader()` đọc một tệp từ [đầu vào tệp](/en-US/docs/Web/HTML/Reference/Elements/input/file). Hàm này hoạt động bằng cách tạo đối tượng {{domxref("FileReader")}} và tạo trình lắng nghe cho sự kiện {{domxref("FileReader/load_event", "load")}}, sao cho khi tệp được đọc, `result` được lấy và truyền vào hàm gọi lại được cung cấp cho `reader()`.

Nội dung được xử lý như dữ liệu văn bản thô.

```js
// Với HTMLInputElement này có type="file":
// <input id="image" type="file" accept="image/*">

function reader(file, callback) {
  const fr = new FileReader();
  fr.onload = () => callback(null, fr.result);
  fr.onerror = (err) => callback(err);
  fr.readAsDataURL(file);
}

document.querySelector("#image").addEventListener("change", (evt) => {
  // Không có tệp, không làm gì.
  if (!evt.target.files) {
    return;
  }
  reader(evt.target.files[0], (err, res) => {
    console.log(res); // Chuỗi Base64 `data:image/...`.
  });
});
```

Do tính bất đồng bộ của {{domxref("FileReader")}}, bạn có thể dùng cách tiếp cận dựa trên Promise. Đây là ví dụ với [đầu vào tệp](/en-US/docs/Web/HTML/Reference/Elements/input/file) có thuộc tính `multiple` trả về một {{jsxref("Promise")}}.

```js
// Với HTMLInputElement này:
// <input id="images" type="file" accept="image/*" multiple>

const reader = (file) =>
  new Promise((resolve, reject) => {
    const fr = new FileReader();
    fr.onload = () => resolve(fr);
    fr.onerror = (err) => reject(err);
    fr.readAsDataURL(file);
  });

async function logImagesData(fileList) {
  let fileResults = [];
  const frPromises = fileList.map(reader);

  try {
    fileResults = await Promise.all(frPromises);
  } catch (err) {
    // Trong trường hợp này, Promise.all() có thể được ưa thích hơn
    // Promise.allSettled(), vì không dễ để sửa đổi
    // FileList thành tập con tệp mà người dùng ban đầu đã chọn.
    // Do đó, hãy bỏ qua toàn bộ thao tác.
    console.error(err);
    return;
  }

  fileResults.forEach((fr) => {
    console.log(fr.result); // Chuỗi Base64 `data:image/...`.
  });
}

// Trình xử lý sự kiện HTMLInputElement type="file":
document.querySelector("#images").addEventListener("change", (evt) => {
  // Không có tệp, không làm gì.
  if (!evt.target.files) {
    return;
  }
  logImagesData([...evt.target.files]);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("FileReader")}}
