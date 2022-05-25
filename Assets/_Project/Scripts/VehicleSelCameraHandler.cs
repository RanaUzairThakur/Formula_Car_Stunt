using UnityEngine;
using System.Collections;
using CnControls;

public class VehicleSelCameraHandler : MonoBehaviour
{


    public Transform target;
    public LayerMask lineOfSightMask = 0;
    
    Rigidbody controller ;

    public float smoothTime = 0.15f;
    public float smoothRotate = 0.1f;

    public float xSensitivity = 150.0f;
    public float ySensitivity = 150.0f;

    public float yMinLimit = 10.0f;
    public float yMaxLimit = 60.0f;
    
    public bool updatePosition = false;

    public float cameraDistance = 2.5f;
    Vector3 targetOffset = Vector3.zero;

    public bool visibleMouseCursor = true;

    [HideInInspector]
    public float x, y, z = 0.0f;

    [HideInInspector]
    public float xSmooth, ySmooth, zSmooth = 0.0f;

    private float xSmooth2 = 0.0f;
    private float ySmooth2 = 0.0f;

    private float distance = 10.0f;

    private float xVelocity = 0.0f;
    private float yVelocity = 0.0f;
    private float zVelocity = 0.0f;

    private float xSmooth2Velocity = 0.0f;
    private float ySmooth2Velocity = 0.0f;

    private Vector3 posVelocity = Vector3.zero;
    private float distanceVelocity = 0.0f;

    private Vector3 targetPos;
    private Quaternion rotation;

    private string CamHorizontal = "Horizontal";
    private string CamVertical = "Vertical";

    void Start()
	{

        Initialize();

		if (visibleMouseCursor) {
			Cursor.visible = true;
		} else {
			Cursor.visible = false;
		}
		var angles = transform.eulerAngles;
		x = angles.y;
		y = angles.x;

        controller = target.GetComponent<Rigidbody>();

//#if UNITY_EDITOR
//        cameraDistance -= 2;

//#endif
}

public void Initialize() {
        
        targetOffset = Vector3.up;

    }

    void LateUpdate()
    {

        if (!target) return;

        FreeMovement_Camera_Update();

    }

    private void FreeMovement_Camera_Update() {


        //#if ANDROID
        //CNC controller scripts
        x += CnInputManager.GetAxis(CamHorizontal) * xSensitivity * 0.02f;
        y -= CnInputManager.GetAxis(CamVertical) * ySensitivity * 0.02f;

        xSmooth2 = Mathf.SmoothDamp(xSmooth2, CnInputManager.GetAxis(CamHorizontal) / 5, ref xSmooth2Velocity, 0.1f);
        ySmooth2 = Mathf.SmoothDamp(ySmooth2, CnInputManager.GetAxis(CamVertical) / 5, ref ySmooth2Velocity, 0.1f);

        //#elif UNITY_EDITOR

        //        x += Input.GetAxis("Mouse X") * xSensitivity * 0.02f;
        //        y -= Input.GetAxis("Mouse Y") * ySensitivity * 0.02f;

        //        xSmooth2 = Mathf.SmoothDamp(xSmooth2, Input.GetAxis("Mouse X") / 5, ref xSmooth2Velocity, 0.1f);
        //        ySmooth2 = Mathf.SmoothDamp(ySmooth2, Input.GetAxis("Mouse Y") / 5, ref ySmooth2Velocity, 0.1f);
        //#endif

        y = ClampAngle(y, yMinLimit, yMaxLimit);
        distance = Mathf.SmoothDamp(distance, Mathf.Clamp(y / 30, -100, 0) + cameraDistance, ref distanceVelocity, 0.2f);

        xSmooth = Mathf.SmoothDamp(xSmooth, x + (CameraMotion(2, 1.0f) * controller.velocity.magnitude), ref xVelocity, smoothTime);
        ySmooth = Mathf.SmoothDamp(ySmooth, y + (CameraMotion(2, 0.5f) * controller.velocity.magnitude), ref yVelocity, smoothTime);
        zSmooth = Mathf.SmoothDamp(zSmooth, (CameraMotion(1, 0.5f) * controller.velocity.magnitude), ref zVelocity, smoothTime);

        //rotation = Quaternion.Euler(ySmooth, xSmooth, zSmooth);
        rotation = Quaternion.Euler(ySmooth, xSmooth, 0);

        targetPos = Vector3.SmoothDamp(targetPos,
        transform.TransformDirection(Mathf.Clamp(xSmooth2, -0.4f, 0.4f), 0, 0)
        + new Vector3(0, targetOffset.y - Mathf.Clamp(ySmooth2, -0.2f, 0.2f)), ref posVelocity, smoothRotate);


        var direction = rotation * -Vector3.forward;


        var targetDistance = AdjustLineOfSight(targetPos + target.position, direction);


        transform.rotation = rotation;

        if(updatePosition)
            transform.position = targetPos + target.position + transform.TransformDirection(targetOffset.x, 0, targetOffset.z) + direction * targetDistance;

    }
    
    float CameraMotion(float speed, float angle)
    {
        return Mathf.PingPong(Time.time * speed, angle) - angle / 2.0f;
    }

    float AdjustLineOfSight(Vector3 target, Vector3 direction)
    {
        RaycastHit hit;

        if (Physics.Raycast(target, direction, out hit, distance, lineOfSightMask.value))
            return hit.distance;
        else
            return distance;
    }

    static float ClampAngle(float angle, float min, float max)
    {
        if (angle < -360)
            angle += 360;
        if (angle > 360)
            angle -= 360;
        return Mathf.Clamp(angle, min, max);
    }
}
