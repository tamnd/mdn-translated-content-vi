---
title: "HTMLInputElement: thuộc tính webkitdirectory"
short-title: webkitdirectory
slug: Web/API/HTMLInputElement/webkitdirectory
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.webkitdirectory
---

{{APIRef("File and Directory Entries API")}}

Thuộc tính **`webkitdirectory`** của giao diện {{domxref("HTMLInputElement")}} phản ánh thuộc tính HTML [`webkitdirectory`](/en-US/docs/Web/HTML/Reference/Elements/input/file#webkitdirectory), cho biết các phần tử [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file) chỉ có thể chọn thư mục thay vì tệp.

Khi một thư mục được chọn, toàn bộ cấu trúc phân cấp của thư mục và nội dung của nó được bao gồm trong tập hợp các mục đã chọn.
Các mục nhập hệ thống tệp đã chọn có thể được lấy bằng thuộc tính {{domxref("HTMLInputElement.webkitEntries", "webkitEntries")}}.

> [!NOTE]
> Thuộc tính này được gọi là `webkitdirectory` trong đặc tả do nguồn gốc là API dành riêng cho Google Chrome.

## Giá trị

Một Boolean; `true` nếu phần tử {{HTMLElement("input")}} chỉ cho phép chọn thư mục hoặc `false` nếu chỉ có thể chọn tệp.

## Mô tả

Đặt `webkitdirectory` thành `true` khiến phần tử đầu vào cung cấp các thư mục cho người dùng chọn thay vì tệp.
Sau khi người dùng chọn một thư mục, mỗi đối tượng {{domxref("File")}} trong `files` trả về có thuộc tính {{domxref("File.webkitRelativePath")}} được đặt thành đường dẫn tương đối so với thư mục tổ tiên đã chọn.
Ví dụ, xem xét hệ thống tệp này:

```plain
PhotoAlbums
├── Birthdays
│   ├── Jamie's 1st birthday
│   │   ├── PIC1000.jpg
│   │   └── PIC1044.jpg
│   └── Don's 40th birthday
│       ├── PIC2343.jpg
│       └── PIC2356.jpg
└── Vacations
    └── Mars
        ├── PIC5556.jpg
        ├── PIC5684.jpg
        └── PIC5712.jpg
```

Nếu người dùng chọn thư mục `PhotoAlbums`, danh sách được báo cáo bởi files sẽ chứa các đối tượng {{domxref("File")}} cho mọi tệp.
Mục nhập cho `PIC2343.jpg` sẽ có `webkitRelativePath` là `PhotoAlbums/Birthdays/Don's 40th birthday/PIC2343.jpg`.
Điều này làm cho việc xác định cấu trúc phân cấp của thư mục đã chọn khả thi mặc dù {{domxref("FileList")}} là phẳng.

> [!NOTE]
> Hành vi của `webkitRelativePath` khác trong _Chromium < 72_.
> Xem [lỗi này](https://crbug.com/124187) để biết thêm chi tiết.

## Ví dụ

Trong ví dụ này, một bộ chọn thư mục được trình bày cho phép người dùng chọn một hoặc nhiều thư mục.
Khi sự kiện {{domxref("HTMLElement/change_event", "change")}} xảy ra, danh sách tất cả các tệp chứa trong các cấu trúc phân cấp thư mục đã chọn được tạo và hiển thị.

### HTML

```html
<input type="file" id="file-picker" name="fileList" webkitdirectory multiple />
<ul id="listing"></ul>
```

### JavaScript

```js
document.getElementById("file-picker").addEventListener("change", (event) => {
  let output = document.getElementById("listing");
  for (const file of event.target.files) {
    let item = document.createElement("li");
    item.textContent = file.webkitRelativePath;
    output.appendChild(item);
  }
});
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("HTMLInputElement.webkitEntries")}}
- {{domxref("File.webkitRelativePath")}}
