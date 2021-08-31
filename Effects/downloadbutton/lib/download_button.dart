import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DownloadStatus {
  fetchingDownload,
  donwloading,
  notDonwload,
  donwloaded,
}

@immutable
class DonwloadButton extends StatefulWidget {
  const DonwloadButton({
    this.transitionDuration = const Duration(milliseconds: 500),
    this.progress = 0.0,
    this.onDownload,
    this.onCancel,
    this.status,
    this.onOpen,
    Key key,
  }) : super(key: key);

  final double progress;
  final VoidCallback onOpen;
  final DownloadStatus status;
  final VoidCallback onCancel;
  final VoidCallback onDownload;
  final Duration transitionDuration;

  @override
  _DonwloadButtonState createState() => _DonwloadButtonState();
}

class _DonwloadButtonState extends State<DonwloadButton> {
  bool get _isFetching => widget.status == DownloadStatus.fetchingDownload;
  bool get _isDownloading => widget.status == DownloadStatus.donwloading;
  bool get _isDownloaded => widget.status == DownloadStatus.donwloaded;

  void _onPressed() {
    switch (widget.status) {
      case DownloadStatus.notDonwload:
        widget.onDownload();
        break;
      case DownloadStatus.fetchingDownload:
        break;
      case DownloadStatus.donwloading:
        widget.onCancel();
        break;
      case DownloadStatus.donwloaded:
        widget.onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          _buildButtonShape(
            child: _buildText(),
          ),
          _buildDownloadingProgress(),
        ],
      ),
    );
  }

  Widget _buildButtonShape({
    Widget child,
  }) {
    return AnimatedContainer(
      duration: widget.transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: _isDownloading || _isFetching
          ? ShapeDecoration(
              shape: const CircleBorder(), color: Colors.white.withOpacity(0.0))
          : ShapeDecoration(
              shape: const StadiumBorder(),
              color: CupertinoColors.lightBackgroundGray,
            ),
      child: child,
    );
  }

  Widget _buildText() {
    final text = _isDownloaded ? 'OPEN' : 'GET';
    final opacity = _isDownloading || _isFetching ? 0.0 : 1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: AnimatedOpacity(
        duration: widget.transitionDuration,
        opacity: opacity,
        curve: Curves.ease,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button?.copyWith(
                fontWeight: FontWeight.bold,
                color: CupertinoColors.activeBlue,
              ),
        ),
      ),
    );
  }

  Widget _buildDownloadingProgress() {
    return Positioned.fill(
      child: AnimatedOpacity(
        duration: widget.transitionDuration,
        opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
        curve: Curves.ease,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildProgressIndicator(),
            if (_isDownloading)
              const Icon(
                Icons.stop,
                size: 14.0,
                color: CupertinoColors.activeBlue,
              )
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return AspectRatio(
      aspectRatio: 1.0,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: widget.progress),
        duration: const Duration(milliseconds: 200),
        builder: (BuildContext context, double progress, Widget child) {
          return CircularProgressIndicator(
            backgroundColor: Colors.white.withOpacity(0.0),
            valueColor: AlwaysStoppedAnimation(
              CupertinoColors.lightBackgroundGray,
            ),
            strokeWidth: 2.0,
            value: null,
          );
        },
      ),
    );
  }
}
