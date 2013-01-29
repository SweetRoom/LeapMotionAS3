package com.leapmotion.leap
{
	import com.leapmotion.leap.events.LeapProxy;
	import com.leapmotion.leap.socket.LeapSocket;

	import flash.events.EventDispatcher;

	/**
	 * The LeapMotion class is your main interface to the Leap device.
	 *
	 * Create an instance of this LeapMotion class to access frames of tracking
	 * data and configuration information. Frame data can be polled at any time
	 * using the LeapMotion.frame() function. Call frame() or frame(0) to get
	 * the most recent frame. Set the history parameter to a positive integer
	 * to access previous frames. A controller stores up to 60 frames in its
	 * frame history.
	 *
	 * Polling is an appropriate strategy for applications which already have
	 * an intrinsic update loop, such as a game. You can also add an event
	 * listener to LeapMotion.controller to handle events as
	 * they occur. The Leap dispatches events to the listener upon initialization
	 * and exiting, on connection changes, and when a new frame of tracking data
	 * is available. When these events occur, the controller object invokes the
	 * appropriate callback function defined in your subclass of Listener.
	 *
	 * The onInit() event is dispatched when the Leap is ready for use.
	 * When a connection is established between the controller and the Leap,
	 * the controller dispatches the onConnect() event. At this point,
	 * your application will start receiving frames of data. The controller
	 * dispatches the onFrame() event each time a new frame is available.
	 * If the controller loses its connection with the Leap software or device
	 * for any reason, it dispatches the onDisconnect() event.
	 * If the listener is removed from the controller or the controller is
	 * destroyed, it dispatches the onExit() event. At that point,
	 * unless the listener is added to another controller again, it will no
	 * longer receive frames of tracking data.
	 *
	 * The LeapMotion object is multithreaded and calls the Listener
	 * functions on its own thread, not on an application thread.
	 *
	 * @author logotype
	 *
	 */
	public class LeapMotion extends EventDispatcher
	{
		private var socket:LeapSocket;
		public var controller:LeapProxy;

		private var frameHistory:Vector.<Frame> = new Vector.<Frame>();

		public function LeapMotion( host:String = null )
		{
			controller = LeapProxy.getInstance();
			socket = new LeapSocket( host );
		}

		/**
		 * Reports whether this Controller is connected to the Leap device.
		 * @return True, if connected; false otherwise.
		 *
		 */
		public function isConnected():Boolean
		{
			return socket.isConnected;
		}

		/**
		 * Returns a frame of tracking data from the Leap.
		 *
		 * Use the optional history parameter to specify which frame to retrieve.
		 * Call frame() or frame(0) to access the most recent frame; call frame(1)
		 * to access the previous frame, and so on. If you use a history value
		 * greater than the number of stored frames, then the controller returns
		 * an invalid frame.
		 *
		 * @param history The age of the frame to return, counting backwards from
		 * the most recent frame (0) into the past and up to the maximum age (59).
		 *
		 * @return The specified frame; or, if no history parameter is specified,
		 * the newest frame. If a frame is not available at the specified
		 * history position, an invalid Frame is returned.
		 *
		 */
		public function frame( history:int = 0 ):Frame
		{
			// TODO: Implement frame history.
			return socket.frame;
		}
	}
}
