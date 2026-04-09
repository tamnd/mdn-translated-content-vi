---
title: URI fragment
short-title: Fragment
slug: Web/URI/Reference/Fragment
page-type: uri-component
spec-urls: https://www.rfc-editor.org/rfc/rfc3986.html#section-3.5
sidebar: urlsidebar
---

**fragment** của một URI là phần cuối cùng của URI, bắt đầu bằng ký tự `#`. Nó được dùng để xác định một phần cụ thể của tài nguyên, chẳng hạn như một mục trong tài liệu hoặc một vị trí trong video. Fragment không được gửi đến máy chủ khi URI được yêu cầu; nó được phía khách (ví dụ: trình duyệt) xử lý sau khi tài nguyên được truy xuất.

## Cú pháp

```url
#fragment
```

- `fragment`
  - : Một chuỗi gồm bất kỳ ký tự nào.
    Định dạng chính xác của fragment do chính tài nguyên đó xác định.

## Mô tả

Hãy xem URL sau:

```url
http://www.example.com:80/path/to/myfile.html?key1=value1&key2=value2#SomewhereInTheDocument
```

`#SomewhereInTheDocument` là _fragment_ của URL, là một neo tới một phần khác của chính tài nguyên đó. Một neo đại diện cho một kiểu "dấu trang" bên trong tài nguyên, cung cấp cho trình duyệt chỉ dẫn để hiển thị nội dung nằm tại vị trí đó. Trong tài liệu HTML, ví dụ, trình duyệt sẽ cuộn đến vị trí nơi neo được định nghĩa. Nó có thể là thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của một phần tử, và trình duyệt sẽ cuộn đến phần tử đó.
Trong tài liệu video hoặc âm thanh, nó có thể là [media fragment](/en-US/docs/Web/URI/Reference/Fragment/Media_fragments) dưới dạng `#t=...`, khiến video hoặc âm thanh bắt đầu phát từ thời điểm đó.

Có một tính năng đặc biệt là [text fragment](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments) cho phép bạn liên kết tới một phần cụ thể của trang web được xác định bằng nội dung văn bản của nó.

## Ví dụ

- `#syntax`
  - : Trình duyệt sẽ cuộn đến phần tử có `id="syntax"` trong tài liệu (mà đối với trang này, chính là tiêu đề [Cú pháp](#syntax)).
- `#:~:text=fragment`
  - : Trình duyệt sẽ tô sáng văn bản [`fragment`](#:~:text=fragment) trong tài liệu; xem [Text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments) để biết thêm chi tiết.
- `#t=10,20`
  - : Video hoặc âm thanh sẽ bắt đầu phát từ giây thứ 10; xem [Media fragments](/en-US/docs/Web/URI/Reference/Fragment/Media_fragments) để biết thêm chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
- [Text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments)
- [Media fragments](/en-US/docs/Web/URI/Reference/Fragment/Media_fragments)
