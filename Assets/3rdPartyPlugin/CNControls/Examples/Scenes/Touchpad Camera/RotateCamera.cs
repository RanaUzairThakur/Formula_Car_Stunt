using CnControls;
using UnityEngine;

namespace Examples.Scenes.TouchpadCamera
{
    public class RotateCamera : MonoBehaviour
    {
        public float RotationSpeed = 15f;
        public float speed;
        public Transform OriginTransform;

        public void Update()
        {
            OriginTransform.Rotate(Vector3.up * speed* Time.deltaTime);
            var horizontalMovement = CnInputManager.GetAxis("Horizontal");

            OriginTransform.Rotate(Vector3.up, horizontalMovement * Time.deltaTime * RotationSpeed);
        }
    }
}