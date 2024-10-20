const Loader = () => {
    return (
        <div style={{ textAlign: 'center', padding: '20px' }}>           
            <div className="loader">
            <span>Loading...</span>
            <img className="wi" src="brain1.gif" alt="Loading..."></img>
            </div>
            <style>{`
                .loader {
            position: relative;
            height: 100vh;
            background: var(--body-color);
        }

        /* Loader image styling */
        .loader img {
            border-radius: 100%;    
            width: 300px;
            height: 300px;
            position: absolute;
            left: 50%;
            right: 0;
            bottom: 0;
            top: 50%;
            display: inline-block;
            transform: translate(-50%, -50%);
        }
            `}</style>
        </div>
    );
};

export default Loader;
