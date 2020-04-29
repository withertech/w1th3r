#import <Foundation/Foundation.h>

// XXFdHijacker - give it a file descriptor, and it will hijack it, meaning that
// any output to that file descriptor will get caught, and the delegate notified with
// the text that was being written.  The hijacker will optionally pass through the
// bytes to the original file descriptor, in essence forming a tee.

// How to use, assuming you're wanting to hijack standard out or standard error:
//
// 1) Make a new hijacker for the underlying file descriptor:
//      self.stdoutHijacker = [XXFdHijacker hijackerWithFd: fileno(stdout)];
//
// 2) Turn off buffering for the stdout FILE (this is important, otherwise you might
//    not see any output:
//      setbuf (stdout, NULL);
//
// 3) Set the delegate, otherwise the hijacking is pretty useless:
//      self.stdoutHijacker.delegate = self;
//
// 4) Start/stop hijacking and/or replication:
//      [self.stdoutHijacker startHijacking];
//      [self.stdoutHijacker startReplicating];
//


@protocol FdHijackerDelegate;

@interface FdHijacker : NSObject

// Make a new hijacker with the given original file descriptor.  Hijacking is off
// by default.
+ (id) hijackerWithFd: (int) fileDescriptor;

@property (weak, nonatomic) id <FdHijackerDelegate> delegate;
@property (readonly, assign, nonatomic) int fileDescriptor;

// Start/stop the hijacking process.
- (void) startHijacking;
- (void) stopHijacking;

// Start/stop the replication process.
- (void) startReplicating;
- (void) stopReplicating;

@end // XXFdHijacker


@protocol FdHijackerDelegate

- (void) hijacker: (FdHijacker *) hijacker  gotText: (NSString *) text;

@end // XXFdHijackerDelegate
