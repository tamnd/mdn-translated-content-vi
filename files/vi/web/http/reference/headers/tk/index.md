---
title: Tk header
short-title: Tk
slug: Web/HTTP/Reference/Headers/Tk
page-type: http-header
status:
  - deprecated
  - non-standard
spec-urls: https://w3c.github.io/dnt/drafts/tracking-dnt.html#dfn-tk
sidebar: http
---

{{Deprecated_header}}{{non-standard_header}}

> [!NOTE]
> Đặc tả DNT (Do Not Track) đã bị ngừng phát triển. Xem {{domxref("Navigator.doNotTrack")}} để biết thêm thông tin.
> Một lựa chọn thay thế là [Global Privacy Control](https://globalprivacycontrol.org/), được truyền đạt đến máy chủ bằng tiêu đề {{HTTPHeader("Sec-GPC")}}, và có thể truy cập bởi máy khách từ {{domxref("navigator.globalPrivacyControl")}}.

Tiêu đề HTTP **`Tk`** {{Glossary("response header")}} cho biết trạng thái theo dõi áp dụng cho yêu cầu tương ứng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Tk: !  (under construction)
Tk: ?  (dynamic)
Tk: G  (gateway or multiple parties)
Tk: N  (not tracking)
Tk: T  (tracking)
Tk: C  (tracking with consent)
Tk: P  (potential consent)
Tk: D  (disregarding DNT)
Tk: U  (updated)
```

### Chỉ thị

- `!`
  - : Đang xây dựng. Máy chủ gốc hiện đang kiểm tra việc truyền đạt trạng thái theo dõi của mình.
- `?`
  - : Động. Máy chủ gốc cần thêm thông tin để xác định trạng thái theo dõi.
- `G`
  - : Cổng hoặc nhiều bên. Máy chủ đang hoạt động như cổng cho một trao đổi liên quan đến nhiều bên.
- `N`
  - : Không theo dõi.
- `T`
  - : Đang theo dõi.
- `C`
  - : Theo dõi có sự đồng ý. Máy chủ gốc tin rằng đã nhận được sự đồng ý trước cho việc theo dõi người dùng, tác nhân người dùng hoặc thiết bị này.
- `P`
  - : Đồng ý tiềm năng. Máy chủ gốc không biết, theo thời gian thực, liệu nó có nhận được sự đồng ý trước cho việc theo dõi người dùng, tác nhân người dùng hoặc thiết bị này hay không, nhưng cam kết không sử dụng hoặc chia sẻ bất kỳ dữ liệu `DNT:1` nào cho đến khi sự đồng ý đó được xác định, và cam kết xóa hoặc ẩn danh vĩnh viễn trong vòng 48 giờ bất kỳ dữ liệu `DNT:1` nào nhận được mà chưa nhận được sự đồng ý.
- `D`
  - : Bỏ qua DNT. Máy chủ gốc không thể hoặc không muốn tôn trọng sở thích theo dõi nhận được từ tác nhân người dùng yêu cầu.
- `U`
  - : Đã cập nhật. Yêu cầu dẫn đến thay đổi tiềm năng đối với trạng thái theo dõi áp dụng cho người dùng, tác nhân người dùng hoặc thiết bị này.

## Ví dụ

Tiêu đề `Tk` cho tài nguyên tuyên bố không theo dõi sẽ trông như sau:

```http
Tk: N
```

## Đặc tả

{{specifications}}

## Tương thích trình duyệt

Tiêu đề phản hồi này không kích hoạt bất kỳ hành vi trình duyệt nào, vì vậy tương thích trình duyệt không liên quan.

## Xem thêm

- Tiêu đề {{HTTPHeader("DNT")}}
- {{domxref("Navigator.doNotTrack")}}
- [Do Not Track trên Wikipedia](https://en.wikipedia.org/wiki/Do_Not_Track)
- [What Does the "Track" in "Do Not Track" Mean? – EFF](https://www.eff.org/deeplinks/2011/02/what-does-track-do-not-track-mean)
- [DNT trên Electronic Frontier Foundation](https://www.eff.org/issues/do-not-track)
- [GPC - Global Privacy Control](https://globalprivacycontrol.org/)
  - [Bật GPC trong Firefox](https://support.mozilla.org/en-US/kb/global-privacy-control?as=u&utm_source=inproduct)
