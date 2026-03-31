---
title: DNT header
short-title: DNT
slug: Web/HTTP/Reference/Headers/DNT
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.DNT
sidebar: http
---

{{Deprecated_header}}{{non-standard_header}}

> [!NOTE]
> Đặc tả DNT (Do Not Track) đã bị ngừng. Xem {{domxref("Navigator.doNotTrack")}} để biết thêm thông tin.

Tiêu đề HTTP **`DNT`** (Do Not Track) {{Glossary("request header")}} chỉ báo sở thích theo dõi của người dùng.
Nó cho phép người dùng chỉ báo liệu họ có muốn quyền riêng tư thay vì nội dung được cá nhân hóa hay không.

DNT đã lỗi thời, thay thế bằng [Global Privacy Control](https://globalprivacycontrol.org/), được truyền đạt đến máy chủ bằng tiêu đề {{HTTPHeader("Sec-GPC")}}, và có thể truy cập với máy khách từ {{domxref("navigator.globalPrivacyControl")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
DNT: 0
DNT: 1
DNT: null
```

## Chỉ thị

- `0`
  - : Người dùng thích cho phép theo dõi trên trang web đích.
- `1`
  - : Người dùng thích không bị theo dõi trên trang web đích.
- `null`
  - : Người dùng chưa chỉ định sở thích về theo dõi.

## Ví dụ

### Đọc trạng thái Do Not Track từ JavaScript

Sở thích DNT của người dùng cũng có thể được đọc từ JavaScript bằng thuộc tính {{domxref("Navigator.doNotTrack")}}:

```js
navigator.doNotTrack; // "0", "1" or null
```

## Đặc tả

Một phần của đặc tả [Tracking Preference Expression (DNT)](https://w3c.github.io/dnt/drafts/tracking-dnt.html#dnt-header-field) đã bị ngừng.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Navigator.doNotTrack")}}
- Tiêu đề {{HTTPHeader("Tk")}}
- [Do Not Track trên Wikipedia](https://en.wikipedia.org/wiki/Do_Not_Track)
- [What Does the "Track" in "Do Not Track" Mean? – EFF](https://www.eff.org/deeplinks/2011/02/what-does-track-do-not-track-mean)
- [DNT trên Electronic Frontier Foundation](https://www.eff.org/issues/do-not-track)
- Trợ giúp cài đặt DNT trong trình duyệt:
  - [Firefox](https://support.mozilla.org/en-US/kb/how-do-i-turn-do-not-track-feature)
  - [Chrome](https://support.google.com/chrome/answer/2790761)
- [GPC - Global Privacy Control](https://globalprivacycontrol.org/)
  - [Bật GPC trong Firefox](https://support.mozilla.org/en-US/kb/global-privacy-control?as=u&utm_source=inproduct)
